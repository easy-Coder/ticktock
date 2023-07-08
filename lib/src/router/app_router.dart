import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticktok/src/features/activity/presentations/activities.dart';
import 'package:ticktok/src/features/activity/presentations/message/direct_message.dart';
import 'package:ticktok/src/features/home/presentations/home_root.dart';
import 'package:ticktok/src/features/post/presentations/create/create_post.dart';
import 'package:ticktok/src/features/profile/presentations/profile_screen.dart';
import 'package:ticktok/src/router/scaffold_with_navbar.dart';

part 'app_router.g.dart';

enum AppRouter {
  home,
  createPost,
  profile,
  inbox,
  directMessage,
}

final GlobalKey<NavigatorState> _rootNavKey = GlobalKey();
final GlobalKey<NavigatorState> _shellNavKey = GlobalKey();
// final GlobalKey<NavigatorState> _shell2NavKey = GlobalKey();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavKey,
        parentNavigatorKey: _rootNavKey,
        builder: (context, state, child) => ScaffoldWithNavBar(
          child: child,
        ),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavKey,
            name: AppRouter.home.name,
            path: '/',
            builder: (context, state) => const HomeRoot(),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavKey,
            name: AppRouter.inbox.name,
            path: '/inbox',
            builder: (context, state) => const ActivitiesScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavKey,
            name: AppRouter.profile.name,
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavKey,
        name: AppRouter.createPost.name,
        path: '/create-post',
        builder: (context, state) => const CreatePost(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavKey,
        name: AppRouter.directMessage.name,
        path: '/direct-message',
        builder: (context, state) => const DirectMessageScreen(),
      ),
    ],
  );
}