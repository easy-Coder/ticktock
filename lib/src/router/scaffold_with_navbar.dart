import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticktok/gen/assets.gen.dart';
import 'package:ticktok/gen/fonts.gen.dart';
import 'package:ticktok/src/router/app_router.dart';

final indexProvider = StateProvider<int>((ref) {
  return 0;
});

class ScaffoldWithNavBar extends ConsumerStatefulWidget {
  const ScaffoldWithNavBar({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends ConsumerState<ScaffoldWithNavBar> {
  void _navigate(int index) {
    if (index == 0) {
      context.goNamed(AppRouter.home.name);
    }
    if (index == 1) {
      // context.goNamed(AppRouter.home.name);
    }
    if (index == 3) {
      context.goNamed(AppRouter.inbox.name);
    }
    if (index == 4) {
      context.goNamed(AppRouter.profile.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(indexProvider);
    return Scaffold(
      backgroundColor: currentIndex == 0 ? Colors.black : Colors.white,
      body: widget.child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        items: [
          NavBarItem(
            icon: Assets.svg.homeStrokeIcon,
            activeIcon: Assets.svg.homeSolidIcon,
            label: 'Home',
          ),
          NavBarItem(
            icon: Assets.svg.searchIcon,
            label: "Discover",
          ),
          NavBarItem(
            icon: Assets.svg.buttonShape,
            activeIcon: Assets.svg.buttonDarkShape,
            onTap: () => context.pushNamed(AppRouter.createPost.name),
          ),
          NavBarItem(
            icon: Assets.svg.messageStrokeIcon,
            activeIcon: Assets.svg.messageSolidIcon,
            label: "Inbox",
          ),
          NavBarItem(
            icon: Assets.svg.accountStrokeIcon,
            activeIcon: Assets.svg.accountSolidIcon,
            label: "Me",
          ),
        ],
        onTap: (index) {
          ref.read(indexProvider.notifier).state = index;
          _navigate(index);
        },
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    this.currentIndex,
    required this.onTap,
    required this.items,
  });

  final int? currentIndex;
  final Function(int value) onTap;
  final List<NavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      color: currentIndex! == 0 ? Colors.black : Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          items.length,
          (index) => GestureDetector(
            onTap: items[index].onTap ?? () => onTap(index),
            child: items[index].label != null
                ? SizedBox(
                    height: 40.h,
                    width: 42.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentIndex == index
                            ? items[index].activeIcon.svg(
                                  width: 24.w,
                                  height: 24.h,
                                  colorFilter: ColorFilter.mode(
                                    currentIndex! == 0
                                        ? Colors.white
                                        : Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                )
                            : items[index].icon.svg(
                                  width: 24.w,
                                  height: 24.h,
                                  colorFilter: ColorFilter.mode(
                                    currentIndex! == 0
                                        ? Colors.grey.shade500
                                        : currentIndex! == 0
                                            ? Colors.white
                                            : Colors.grey.shade700,
                                    BlendMode.srcIn,
                                  ),
                                ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          items[index].label!,
                          style: TextStyle(
                            color: currentIndex == index
                                ? currentIndex! == 0
                                    ? Colors.white
                                    : Colors.black
                                : Colors.grey.shade500,
                            fontSize: 10.sp,
                            fontFamily: FontFamily.proximaNova,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.15.w,
                          ),
                        ),
                      ],
                    ),
                  )
                : currentIndex! == 0
                    ? items[index].icon.svg(width: 24.w, height: 24.h)
                    : items[index].activeIcon.svg(width: 24.w, height: 24.h),
          ),
        ),
      ),
    );
  }
}

class NavBarItem {
  const NavBarItem({
    required this.icon,
    SvgGenImage? activeIcon,
    this.label,
    this.onTap,
  }) : activeIcon = activeIcon ?? icon;

  final SvgGenImage icon;
  final SvgGenImage activeIcon;
  final String? label;
  final VoidCallback? onTap;
}
