import 'package:go_router/go_router.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/garden/screens/dashboard_screen.dart';

class AppRouter {
  static GoRouter getRouter(bool hasCompletedOnboarding) {
    return GoRouter(
      initialLocation: hasCompletedOnboarding ? '/dashboard' : '/onboarding',
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/dashboard', // <-- Changed path
          builder: (context, state) =>
              const DashboardScreen(), // <-- Route to Dashboard
        ),
      ],
    );
  }
}
