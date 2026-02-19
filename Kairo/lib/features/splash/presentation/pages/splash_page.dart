import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kairo/core/theme/app_spacing.dart';
import 'package:kairo/core/widgets/loading/app_progress.dart';
import 'package:kairo/features/auth/presentation/providers/auth_notifier.dart';
import 'package:kairo/features/splash/presentation/providers/splash_provider.dart';

/// Splash page shown at app launch.
///
/// Runs init checks and navigates to the appropriate screen.
class SplashPage extends ConsumerWidget {
  /// Creates a [SplashPage].
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashInitProvider, (_, next) {
      if (!context.mounted) return;
      switch (next) {
        case AsyncData(:final value):
          // Hydrate auth state for router guards (safe here — widget layer,
          // not inside a provider build). Fire-and-forget is fine because
          // the router redirect already allows AuthInitial/AuthLoading.
          if (value != SplashResult.onboarding) {
            ref.read(authNotifierProvider.notifier).checkAuthStatus();
          }
          switch (value) {
            case SplashResult.onboarding:
              context.go('/onboarding');
            case SplashResult.authenticated:
              context.go('/dashboard');
            case SplashResult.unauthenticated:
              context.go('/login');
          }
        case AsyncError():
          context.go('/login');
        case _:
          break;
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/logo-gradient.svg',
              width: 100,
              height: 100,
            ),
            AppSpacing.verticalXl,
            const AppProgress(),
          ],
        ),
      ),
    );
  }
}
