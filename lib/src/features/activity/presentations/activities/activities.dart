import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticktok/gen/assets.gen.dart';
import 'package:ticktok/src/router/app_router.dart';

class ActivitiesScreen extends ConsumerWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: DropdownButton(
            value: "All activity",
            items: const [
              DropdownMenuItem(
                value: "All activity",
                child: Text("All activity"),
              ),
            ],
            style: TextStyle(
              color: const Color(0xFF161722),
              fontSize: 17.sp,
              fontFamily: 'Proxima Nova',
              fontWeight: FontWeight.w700,
            ),
            underline: Container(
              decoration: const BoxDecoration(),
            ),
            onChanged: (value) {},
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () => context.pushNamed(AppRouter.directMessage.name),
                child: Assets.svg.telegram.svg(
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn)),
              ),
            ),
          ],
        ),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.svg.messageStrokeIcon.svg(
                  width: 68,
                  height: 68,
                  colorFilter: const ColorFilter.mode(
                      Color(0xffB0B0B3), BlendMode.srcIn),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Text(
                  'Notifications aren’t available',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF161722),
                    fontSize: 17,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Text(
                  'Notifications about your account will appear here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF7C7D83),
                    fontSize: 14,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
