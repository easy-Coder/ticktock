import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticktok/gen/assets.gen.dart';

class FindFriendScreen extends ConsumerWidget {
  const FindFriendScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF161722),
        title: Text(
          "Find Friends",
          style: TextStyle(
            color: const Color(0xFF161722),
            fontSize: 17.sp,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Assets.svg.scannerIcon.svg()),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: const Color(0xffF1F1F2),
                filled: true,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: const Color(0xFF86878B),
                  fontSize: 15.sp,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Color(0xff161722),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SocialRows(
              title: "Invite Friends",
              icon: Container(
                width: 56.w,
                height: 56.w,
                decoration: const ShapeDecoration(
                  color: Color(0xFFED7360),
                  shape: OvalBorder(),
                ),
                alignment: Alignment.center,
                child: Assets.svg.addAccountIcon.svg(
                  width: 30.w,
                  height: 30.w,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            SocialRows(
              title: "Find Contacts",
              icon: Container(
                width: 56.w,
                height: 56.w,
                decoration: const ShapeDecoration(
                  color: Color(0xFF67DDA0),
                  shape: OvalBorder(),
                ),
                alignment: Alignment.center,
                child: Assets.svg.calSoildIcon.svg(
                  width: 30.w,
                  height: 30.w,
                ),
              ),
            ),
            SocialRows(
              title: "Find Facebook friends",
              icon: Assets.svg.facebook.svg(
                width: 56.w,
                height: 56.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialRows extends StatelessWidget {
  const SocialRows({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF161722),
                    fontSize: 15.sp,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Color(0xff86878B),
          )
        ],
      ),
    );
  }
}
