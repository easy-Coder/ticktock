import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticktok/src/features/account/presentations/edit_profile/edit_profile_screen.dart';
import 'package:ticktok/src/features/activity/presentations/activities/activities.dart';
import 'package:ticktok/src/features/activity/presentations/message/direct_message.dart';
import 'package:ticktok/src/features/home/presentations/home_root.dart';
import 'package:ticktok/src/features/post/presentations/create/create_post.dart';
import 'package:ticktok/src/features/account/presentations/profile/profile_screen.dart';
import 'package:ticktok/src/router/scaffold_with_navbar.dart';

part 'app_router.g.dart';

enum AppRouter {
  home,
  createPost,
  profile,
  inbox,
  directMessage,
  editProfile,
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
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeRoot()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavKey,
            name: AppRouter.inbox.name,
            path: '/inbox',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ActivitiesScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavKey,
            name: AppRouter.profile.name,
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
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
      GoRoute(
        parentNavigatorKey: _rootNavKey,
        name: AppRouter.editProfile.name,
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
    ],
  );
}
