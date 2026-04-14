import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void nextPage() {
    if (state < 4) {
      emit(state + 1);
    }
  }

  void previousPage() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  // Called on the final screen to ensure they never see onboarding again
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', true);
    // Note: Routing logic to the Garden screen will be handled in the UI/Router later
  }
}