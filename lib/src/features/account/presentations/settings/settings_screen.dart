import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticktok/gen/assets.gen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF161722),
        title: Text(
          "Privacy and Settings",
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
          top: 20.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
            SettingsGroup(
              title: "ACCOUNT",
              settingsItem: [
                SettingsItem(
                  title: "Manage my account",
                  icon: Assets.svg.accountStrokeIcon.svg(
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Privacy and Safety",
                  icon: Assets.svg.lockStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Content Preferences",
                  icon: Assets.svg.videcameraStrokeIcon.svg(
                    width: 18.w,
                    height: 18.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Balance",
                  icon: Assets.svg.walletStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Share Profile",
                  icon: Assets.svg.shareStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "TickCode",
                  icon: Assets.svg.qRCodeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SettingsGroup(
              title: "GENERAL",
              settingsItem: [
                SettingsItem(
                  title: "Push Notification",
                  icon: Assets.svg.bellIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Language",
                  icon: Assets.svg.bookStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Content Preferences",
                  icon: Assets.svg.videcameraStrokeIcon.svg(
                    width: 18.w,
                    height: 18.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Digital Wellbeing",
                  icon: Assets.svg.umbrellaStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Accessibility",
                  icon: Assets.svg.accebilityStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Data Saver",
                  icon: Assets.svg.dropStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SettingsGroup(
              title: "SUPPORT",
              settingsItem: [
                SettingsItem(
                  title: "Report a problem",
                  icon: Assets.svg.penStrokeIcon.svg(
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
                SettingsItem(
                  title: "Help Center",
                  icon: Assets.svg.questionStrokeIcon.svg(
                    width: 24.w,
                    height: 24.w,
                    colorFilter: const ColorFilter.mode(
                        Color(0xff86878B), BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({
    super.key,
    required this.title,
    required this.settingsItem,
  });

  final String title;
  final List<SettingsItem> settingsItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF86878B),
                  fontSize: 13.sp,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          ...settingsItem,
          const Divider(),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 15.w,
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
