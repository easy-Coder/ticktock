import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticktok/gen/assets.gen.dart';
import 'package:ticktok/src/features/account/presentations/profile/widgets/post_grid.dart';
import 'package:ticktok/src/features/account/presentations/profile/widgets/tabbar_header.dart';
import 'package:ticktok/src/router/app_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          scrolledUnderElevation: 0,
          leading: GestureDetector(
            onTap: () => context.pushNamed(AppRouter.findFriends.name),
            child: Container(
              margin: EdgeInsets.only(left: 16.w),
              child: Assets.svg.addAccountIcon.svg(width: 22.w, height: 22.w),
            ),
          ),
          leadingWidth: 44.w,
          title: DropdownButton(
            value: "Jacob West",
            items: const [
              DropdownMenuItem(
                value: "Jacob West",
                child: Text("Jacob West"),
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
            IconButton(
                onPressed: () {
                  context.pushNamed(AppRouter.settings.name);
                },
                icon: Icon(
                  Icons.more_horiz,
                  size: 32.w,
                ))
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/96x96"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                const Text(
                  '@jacob_w',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF161722),
                    fontSize: 17,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfileCount(
                      count: 14,
                      title: "Following",
                    ),
                    SizedBox(
                      width: 37.w,
                    ),
                    const ProfileCount(
                      count: 38,
                      title: "Followers",
                    ),
                    SizedBox(
                      width: 49.w,
                    ),
                    const ProfileCount(
                      count: 91,
                      title: "Like",
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          context.pushNamed(AppRouter.editProfile.name),
                      child: Container(
                        width: 164.w,
                        height: 44.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFE3E3E4)),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Edit profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.h,
                    ),
                    Container(
                      width: 44.w,
                      height: 44.w,
                      padding: EdgeInsets.all(8.w),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFFE3E3E4)),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      child: Assets.svg.bookmarkIcon.svg(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                Text(
                  'Tap to add bio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF86878B),
                    fontSize: 14.sp,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
        // Tabbar
        SliverPersistentHeader(
          pinned: true,
          delegate: TabBarHeader(
            tabBar: TabBar(
              controller: controller,
              indicatorColor: Colors.black,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 47.w),
              tabs: [
                const Tab(
                  icon: Icon(
                    Icons.grid_view_rounded,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Assets.svg.heartHideStrokeIcon.svg(),
                ),
              ],
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: controller,
        children: [
          PostGrid(count: 5),
          PostGrid(count: 7),
        ],
      ),
    );
  }
}

class ProfileCount extends StatelessWidget {
  final int count;

  final String title;

  const ProfileCount({
    super.key,
    required this.count,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF161722),
            fontSize: 17,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF86878B),
            fontSize: 13,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
