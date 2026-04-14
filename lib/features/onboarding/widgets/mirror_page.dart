import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/onboarding_cubit.dart';

class MirrorPage extends StatelessWidget {
  const MirrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF121212), // Deep dark background
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 2),
          const Text("📱", style: TextStyle(fontSize: 48))
              .animate()
              .fadeIn(duration: 800.ms, delay: 200.ms)
              .slideY(begin: 0.2, end: 0),
          const SizedBox(height: 24),
          const Text(
            "You opened your phone to study.",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.3,
            ),
          ).animate().fadeIn(duration: 1000.ms, delay: 800.ms),
          const SizedBox(height: 12),
          Text(
            "That was 47 minutes ago.",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Theme.of(
                context,
              ).colorScheme.primary, // The deep organic green
              height: 1.3,
            ),
          ).animate().fadeIn(duration: 1000.ms, delay: 2000.ms),
          const Spacer(flex: 2),

          // The action button
          Center(
            child:
                ElevatedButton(
                  onPressed: () {
                    // Trigger haptic feedback here later
                    context.read<OnboardingCubit>().nextPage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "That's me",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ).animate().fadeIn(
                  duration: 800.ms,
                  delay: 3500.ms,
                ), // Button appears last
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
