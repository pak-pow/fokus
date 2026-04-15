import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/onboarding_cubit.dart';
import 'package:go_router/go_router.dart';

class SeedPage extends StatefulWidget {
  const SeedPage({super.key});

  @override
  State<SeedPage> createState() => _SeedPageState();
}

class _SeedPageState extends State<SeedPage> {
  final TextEditingController _taskController = TextEditingController();
  bool _isTyping = false;

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Left-aligned for a more personal feel
        children: [
          const Spacer(flex: 2),

          // Icon accent
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.psychology_alt_rounded,
              color: colorScheme.primary,
              size: 32,
            ),
          ).animate().scaleXY(
            begin: 0.5,
            end: 1.0,
            duration: 600.ms,
            curve: Curves.easeOutBack,
          ),

          const SizedBox(height: 32),

          Text(
                "Plant your first seed.",
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                  letterSpacing: -0.5,
                ),
              )
              .animate()
              .fadeIn(duration: 800.ms, delay: 300.ms)
              .slideX(begin: -0.1, end: 0),

          const SizedBox(height: 12),

          Text(
                "What are you focusing on today?",
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              )
              .animate()
              .fadeIn(duration: 800.ms, delay: 600.ms)
              .slideX(begin: -0.1, end: 0),

          const SizedBox(height: 48),

          // Premium Text Input
          TextField(
                controller: _taskController,
                onChanged: (text) {
                  setState(() {
                    _isTyping = text.trim().isNotEmpty;
                  });
                },
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface,
                ),
                cursorColor: colorScheme.primary,
                decoration: InputDecoration(
                  hintText: "e.g., Data Structures Study",
                  hintStyle: TextStyle(
                    color: colorScheme.onSurface.withOpacity(0.3),
                  ),
                  filled: true,
                  fillColor: colorScheme.onSurface.withOpacity(0.05),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: colorScheme.primary.withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 800.ms, delay: 1000.ms)
              .slideY(begin: 0.2, end: 0),

          const Spacer(flex: 2),

          // Dynamic Action Button (Only fully visible when they type something)
          AnimatedOpacity(
            opacity: _isTyping ? 1.0 : 0.4,
            duration: const Duration(milliseconds: 300),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: _isTyping
                    ? () async {
                        // Mark onboarding as complete in SharedPreferences
                        await context
                            .read<OnboardingCubit>()
                            .completeOnboarding();

                        if (context.mounted) {
                          // Route to the main garden screen!
                          context.go('/garden');
                        }
                      }
                    : null,
                icon: const Icon(Icons.auto_awesome),
                label: const Text("Plant my first seed"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: _isTyping ? 4 : 0,
                  shadowColor: colorScheme.primary.withOpacity(0.5),
                  textStyle: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(delay: 1500.ms),

          const Spacer(),
        ],
      ),
    );
  }
}
