import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/onboarding_cubit.dart';

class CostPage extends StatelessWidget {
  const CostPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the theme colors as dictated by the design system
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: colorScheme.surface, // Earthy/Dark background from theme
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),

          // The Empty Garden Visual (Using a subtle glassmorphic container + icon until Lottie is ready)
          Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.onSurface.withOpacity(0.03),
                  border: Border.all(
                    color: colorScheme.onSurface.withOpacity(0.08),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.spa_outlined, // A bare, dormant seed/sprout
                  size: 80,
                  color: colorScheme.onSurface.withOpacity(0.2),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scaleXY(
                begin: 0.98,
                end: 1.02,
                duration: 3.seconds,
                curve: Curves.easeInOutSine,
              ) // Very slow, calm breathing
              .fadeIn(duration: 1200.ms),

          const SizedBox(height: 56), // Generous breathing room

          Text(
                "Every distraction is a seed",
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

          const SizedBox(height: 8),

          Text(
                "that never gets planted.",
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface.withOpacity(
                    0.5,
                  ), // Faded for emotional impact
                  height: 1.4,
                ),
              )
              .animate()
              .fadeIn(duration: 800.ms, delay: 1400.ms)
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
                          "See what's possible",
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.primary, // Deep organic green
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
                    .fadeIn(delay: 2500.ms)
                    .moveX(begin: -5, end: 0, duration: 800.ms),
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
