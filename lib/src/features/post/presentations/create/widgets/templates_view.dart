import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _pageProvider = StateProvider<double>((ref) {
  return 0.0;
});

class TemplatesView extends ConsumerStatefulWidget {
  const TemplatesView({super.key});

  @override
  ConsumerState<TemplatesView> createState() => _UploadViewState();
}

class _UploadViewState extends ConsumerState<TemplatesView> {
  late final PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(
        initialPage: ref.read(_pageProvider).floor(),
        viewportFraction: 0.8,
        keepPage: false);
    controller.addListener(() {
      ref.read(_pageProvider.notifier).state = controller.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(_pageProvider);
    return Padding(
      padding: EdgeInsets.only(top: 56.5.h),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'My 2020',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            'Upload up to 8 photos',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 15,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.60,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 440.h,
            child: PageView.builder(
              controller: controller,
              itemCount: 4,
              // reverse: true,
              itemBuilder: (context, index) {
                double diff = index - currentPage;
                double scaleValue = 1 + diff.abs() * 0.06;
                return Transform(
                  transform: Matrix4.identity()..setEntry(3, 3, scaleValue),
                  alignment: FractionalOffset.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/248x440"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19FFFFFF),
                          blurRadius: 2,
                          offset: Offset(0, 2.50),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            '${currentPage.floor() + 1}/4',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 12,
              fontFamily: 'Proxima Nova',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 56.h,
          ),
          Container(
            // width: 270,
            padding: EdgeInsets.symmetric(horizontal: 89.w, vertical: 13.h),
            decoration: ShapeDecoration(
              color: const Color(0xFFEA4359),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            // alignment: Alignment.center,
            child: const Text(
              'Select photos',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
