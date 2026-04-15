import 'package:go_router/go_router.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/garden/screens/garden_screen.dart';

class AppRouter {
  static GoRouter getRouter(bool hasCompletedOnboarding) {
    return GoRouter(
      initialLocation: hasCompletedOnboarding ? '/garden' : '/onboarding',
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/garden',
          builder: (context, state) => const GardenScreen(),
        ),
      ],
    );
  }
}
