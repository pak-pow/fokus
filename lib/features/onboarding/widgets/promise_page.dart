import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/onboarding_cubit.dart';

class PromisePage extends StatelessWidget {
  const PromisePage({super.key});

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

          // The Shield/Lock Visual (Using our warm amber secondary color)
          Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.secondary.withOpacity(0.1),
                  border: Border.all(
                    color: colorScheme.secondary.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.shield_rounded, // Symbolizing protection of their time
                  size: 72,
                  color: colorScheme.secondary,
                ),
              )
              .animate()
              .scaleXY(
                begin: 0.5,
                end: 1.0,
                duration: 800.ms,
                curve: Curves.easeOutBack,
              )
              .fadeIn(),

          const SizedBox(height: 56),

          Text(
                "We'll guard your focus",
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
                "so you can guard your future.",
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface.withOpacity(0.7),
                  height: 1.4,
                ),
              )
              .animate()
              .fadeIn(duration: 800.ms, delay: 1200.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: 24),

          Text(
            "One tap blocks distractions. No willpower required.",
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.5),
              height: 1.5,
            ),
          ).animate().fadeIn(duration: 800.ms, delay: 1800.ms),

          const Spacer(flex: 2),

          // Action Button (This is where we will eventually ask for Android Permissions)
          ElevatedButton(
            onPressed: () {
              // TODO: Wire up Android PACKAGE_USAGE_STATS permission request here later
              context.read<OnboardingCubit>().nextPage();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  colorScheme.secondary, // Amber button for the shield
              foregroundColor: colorScheme.surface, // Dark text
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24), // Soft pill shape
              ),
              elevation: 0,
            ),
            child: Text(
              "Enable Focus Shield",
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.surface,
              ),
            ),
          ).animate().fadeIn(delay: 2400.ms).scaleXY(begin: 0.9, end: 1.0),

          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
