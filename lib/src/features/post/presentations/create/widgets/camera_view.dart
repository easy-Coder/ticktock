import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticktok/gen/assets.gen.dart';

final cameraProvider = Provider<List<CameraDescription>>((ref) {
  throw UnimplementedError();
});

class CameraView extends ConsumerStatefulWidget {
  const CameraView({super.key, required int timer});

  @override
  ConsumerState<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends ConsumerState<CameraView> {
  late final CameraController controller;
  List<CameraDescription> _cameras = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameras = ref.read(cameraProvider);

    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !controller.value.isInitialized
        ? Container()
        : Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CameraPreview(controller),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 52.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svg.doubleToneIcon.svg(),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        'Sounds',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 42.h, right: 14.w),
                  child: Column(
                    children: [
                      CameraButton(
                        icon: Assets.svg.flipIcon.svg(),
                        title: 'Flip',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CameraButton(
                        icon: Assets.svg.speedIcon.svg(),
                        title: 'Speed',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CameraButton(
                        icon: Assets.svg.magicPenIcon.svg(),
                        title: 'Beauty',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CameraButton(
                        icon: Assets.svg.filtersIcon.svg(),
                        title: 'Filters',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CameraButton(
                        icon: Assets.svg.timerIcon.svg(),
                        title: 'Timer',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CameraButton(
                        icon: Assets.svg.union.svg(),
                        title: 'Flash',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 68.w,
                    vertical: 33.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CameraButton(
                        icon: Assets.svg.effectsIllustration.svg(
                          width: 34.w,
                          height: 34.h,
                        ),
                        title: "Effects",
                      ),
                      CameraButton(
                          icon: Assets.svg.recordButton.svg(
                        width: 80.w,
                        height: 80.h,
                      )),
                      CameraButton(
                        icon: Assets.svg.uploadIllustration.svg(
                          width: 34.w,
                          height: 34.h,
                        ),
                        title: "Upload",
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({
    super.key,
    required this.icon,
    this.title,
    this.onTap,
  });

  final Widget icon;
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: title != null
          ? SizedBox(
              child: Column(
                children: [
                  icon,
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            )
          : icon,
    );
  }
}
