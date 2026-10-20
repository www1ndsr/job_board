import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Импорт экранов
import 'screens/auth_screen.dart';
import 'screens/job_list_screen.dart';
import 'screens/job_detail_screen.dart';
import 'screens/apply_form_screen.dart';
import 'screens/my_applications_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/app_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    // Вход вне Shell (без нижней панели навигации)
    GoRoute(
      path: '/login',
      builder: (context, state) => const AuthScreen(),
    ),

    // Постоянные вкладки (ShellRoute)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        // Ветка 1: Список вакансий
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/jobs',
              builder: (context, state) => const JobListScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return JobDetailScreen(jobId: id);
                  },
                ),
              ],
            ),
          ],
        ),

        // Ветка 2: Отклик
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/apply',
              builder: (context, state) => const ApplyFormScreen(),
            ),
          ],
        ),

        // Ветка 3: Мои отклики
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/applications',
              builder: (context, state) => const MyApplicationsScreen(),
            ),
          ],
        ),

        // Ветка 4: Профиль
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);