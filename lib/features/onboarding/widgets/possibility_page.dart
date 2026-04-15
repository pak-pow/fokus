import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/onboarding_cubit.dart';

class PossibilityPage extends StatelessWidget {
  const PossibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),

          // The Blooming Garden Visual (Using a glowing glassmorphic container + icon until Lottie is ready)
          Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primary.withOpacity(0.05),
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.15),
                      blurRadius: 50,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.local_florist_rounded, // A blooming, lush flower
                  size: 100,
                  color: colorScheme.primary,
                ),
              )
              .animate()
              .scaleXY(
                begin: 0.8,
                end: 1.0,
                duration: 1200.ms,
                curve: Curves.easeOutBack,
              ) // Springy, alive entrance
              .fadeIn(duration: 800.ms),

          const SizedBox(height: 56),

          Text(
                "What could 30 days of focus look like?",
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                  height: 1.4,
                ),
              )
              .animate()
              .fadeIn(duration: 800.ms, delay: 600.ms)
              .slideY(begin: 0.1, end: 0),

          const Spacer(flex: 2),

          // Action / Swipe Indicator
          GestureDetector(
            onTap: () => context.read<OnboardingCubit>().nextPage(),
            child:
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Show me",
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: colorScheme.primary,
                          size: 18,
                        ),
                      ],
                    )
                    .animate()
                    .fadeIn(delay: 1500.ms)
                    .moveX(begin: -5, end: 0, duration: 800.ms),
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
