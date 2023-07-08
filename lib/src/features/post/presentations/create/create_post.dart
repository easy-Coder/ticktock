import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticktok/src/features/post/presentations/create/widgets/camera_view.dart';
import 'package:ticktok/src/features/post/presentations/create/widgets/templates_view.dart';

final pageProvider = StateProvider<int>((ref) {
  return 1;
});

class CreatePost extends ConsumerStatefulWidget {
  const CreatePost({super.key});

  @override
  ConsumerState<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends ConsumerState<CreatePost> {
  late final PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(
        initialPage: ref.read(pageProvider),
        keepPage: true,
        viewportFraction: 0.17);
    _controller.addListener(() {
      ref.read(pageProvider.notifier).state = _controller.page!.floor();
    });
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final pageList = [
    "60s",
    "15s",
    "Templates",
  ];

  List<Widget> _buildPage() {
    final widgets = [
      const CameraView(timer: 60),
      const CameraView(timer: 15),
      const TemplatesView(),
    ];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(pageProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFF232320),
              Color(0xFF2D2C28),
              Color(0xFF18181A),
              Color(0xFF131313)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: _buildPage()[currentPage],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 32.h),
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(
                            Icons.close,
                            size: 32.w,
                            weight: 4,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 33.h,
                  bottom: 16.h,
                ),
                // margin: EdgeInsets.symmetric(
                //   horizontal: 63.w,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 18.h,
                      child: PageView.builder(
                          controller: _controller,
                          itemCount: pageList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate),
                              child: Text(
                                pageList[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: currentPage == index
                                      ? Colors.white
                                      : Colors.white60,
                                  fontSize: 15.sp,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                      margin: EdgeInsets.only(top: 6.h),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
