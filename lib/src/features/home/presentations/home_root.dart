import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticktok/src/features/home/presentations/following/following_view.dart';
import 'package:ticktok/src/features/home/presentations/for_you/for_you_view.dart';

class HomeRoot extends ConsumerStatefulWidget {
  const HomeRoot({super.key});

  @override
  ConsumerState<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends ConsumerState<HomeRoot>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabBarView(
          controller: _tabController,
          children: const [
            FollowingView(),
            ForYouView(),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Container(
              width: 240.w,
              height: 44.h,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              alignment: Alignment.topCenter,
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.white,
                indicator: const BoxDecoration(),
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(
                    text: "Following",
                  ),
                  Tab(
                    text: "For You",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
