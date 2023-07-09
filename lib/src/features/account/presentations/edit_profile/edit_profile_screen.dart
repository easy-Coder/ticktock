import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticktok/gen/assets.gen.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF161722),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: const Color(0xFF161722),
            fontSize: 17.sp,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0.1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 44.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: ShapeDecoration(
                        color: Colors.grey.shade300,
                        image: const DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/96x96"),
                          fit: BoxFit.fill,
                        ),
                        shape: const OvalBorder(),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: ColoredBox(
                        color: Colors.black26,
                        child: Center(
                          child: Assets.svg.cameraStrokeIcon
                              .svg(width: 27.w, height: 27.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    const Text(
                      'Change photo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF161722),
                        fontSize: 14,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 75.w,
                ),
                Column(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: ShapeDecoration(
                        color: Colors.grey.shade300,
                        image: const DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/96x96"),
                          fit: BoxFit.fill,
                        ),
                        shape: const OvalBorder(),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Center(
                        child: Assets.svg.videcameraStrokeIcon
                            .svg(width: 30.w, height: 22.w),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    const Text(
                      'Change video',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF161722),
                        fontSize: 14,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 49.h,
            ),
            const ProfileCard(
              title: "Name",
              attr: "Jacob West",
            ),
            const ProfileCard(
              title: "Username",
              attr: "Jacob_w",
            ),
            ProfileCard(
              attr: "Jacob West",
              icon: Assets.svg.clipboardStrokeIcon.svg(),
            ),
            const ProfileCard(
              title: "Bio",
              attr: "Add a bio to your profile",
            ),
            const Divider(),
            const ProfileCard(
              title: "Instagram",
              attr: "Add Instagram to your profile",
            ),
            const ProfileCard(
              title: "Youtube",
              attr: "Add YouTube to your profile",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    this.title,
    required this.attr,
    this.icon,
  });

  final String? title;
  final String attr;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Row(
        mainAxisAlignment: title == null
            ? MainAxisAlignment.end
            : MainAxisAlignment.spaceBetween,
        children: [
          if (title != null)
            Text(
              title!,
              style: TextStyle(
                color: const Color(0xFF161722),
                fontSize: 15.sp,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w400,
              ),
            ),
          SizedBox(
            child: Row(
              children: [
                Text(
                  attr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF86878B),
                    fontSize: 15.sp,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (icon != null)
                  SizedBox(
                    width: 7.w,
                  ),
                icon ??
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff86878B),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
