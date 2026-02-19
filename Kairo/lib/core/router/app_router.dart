import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kairo/core/providers/analytics_provider.dart';
import 'package:kairo/core/providers/storage_providers.dart';
import 'package:kairo/core/router/analytics_observer.dart';
import 'package:kairo/core/router/page_transitions.dart';
import 'package:kairo/core/router/route_names.dart';
import 'package:kairo/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:kairo/features/auth/presentation/pages/login_page.dart';
import 'package:kairo/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:kairo/features/auth/presentation/pages/register_page.dart';
import 'package:kairo/features/auth/presentation/providers/auth_notifier.dart';
import 'package:kairo/features/auth/presentation/providers/auth_state.dart';
import 'package:kairo/features/home/presentation/pages/home_page.dart';
import 'package:kairo/features/notes/presentation/pages/note_detail_page.dart';
import 'package:kairo/features/notes/presentation/pages/notes_page.dart';
import 'package:kairo/features/home/presentation/pages/home_shell.dart';
import 'package:kairo/features/home/presentation/pages/profile_page.dart';
import 'package:kairo/features/home/presentation/pages/settings_page.dart';
import 'package:kairo/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:kairo/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

/// Public routes that don't require authentication.
const _publicPaths = [
  RouteNames.splash,
  RouteNames.onboarding,
  RouteNames.login,
  RouteNames.register,
  RouteNames.forgotPassword,
  RouteNames.otpVerification,
];

/// Provides the application [GoRouter] instance.
///
/// Listens to [authNotifierProvider] for authentication state changes
/// and redirects accordingly. Splash handles initial navigation;
/// the router only enforces auth/onboarding guards after splash.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authState = ValueNotifier<AuthState>(const AuthInitial());

  ref
    ..listen(authNotifierProvider, (_, next) {
      authState.value = next;
    })
    ..onDispose(authState.dispose);

  final analytics = ref.read(analyticsServiceProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.splash,
    refreshListenable: authState,
    observers: [AnalyticsObserver(analytics)],
    redirect: (context, state) {
      final currentPath = state.matchedLocation;
      final auth = authState.value;

      // Never redirect away from splash — it handles its own navigation.
      if (currentPath == RouteNames.splash) return null;

      // Don't redirect while auth state is still initializing.
      if (auth is AuthInitial || auth is AuthLoading) return null;

      final isPublicRoute = _publicPaths.contains(currentPath);

      // Redirect authenticated users away from auth pages.
      if (auth is AuthAuthenticated && isPublicRoute) {
        return RouteNames.home;
      }

      // Redirect unauthenticated users to login for protected routes.
      if (auth is AuthUnauthenticated && !isPublicRoute) {
        return RouteNames.login;
      }

      // Check onboarding completion for the login route.
      if (auth is AuthUnauthenticated && currentPath == RouteNames.login) {
        final localStorage = ref.read(localStorageProvider);
        if (!localStorage.isOnboardingComplete && localStorage.isFirstLaunch) {
          return RouteNames.onboarding;
        }
      }

      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.matchedLocation}'),
      ),
    ),
    routes: [
      // Splash
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splashName,
        builder: (context, state) => const SplashPage(),
      ),

      // Onboarding
      GoRoute(
        path: RouteNames.onboarding,
        name: RouteNames.onboardingName,
        builder: (context, state) => const OnboardingPage(),
      ),

      // Auth routes
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.loginName,
        pageBuilder: (context, state) => AppPageTransitions.fade(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: RouteNames.register,
        name: RouteNames.registerName,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        name: RouteNames.forgotPasswordName,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: RouteNames.otpVerification,
        name: RouteNames.otpVerificationName,
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return OtpVerificationPage(email: email);
        },
      ),

      // Home shell with bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.home,
                name: RouteNames.homeName,
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    path: 'notes',
                    name: RouteNames.notesName,
                    builder: (context, state) => const NotesPage(),
                    routes: [
                      GoRoute(
                        path: 'detail',
                        name: RouteNames.noteDetailName,
                        builder: (context, state) {
                          final noteId = state.extra as String?;
                          return NoteDetailPage(noteId: noteId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.profile,
                name: RouteNames.profileName,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: RouteNames.settings,
                name: RouteNames.settingsName,
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
