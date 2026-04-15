import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GardenScreen extends StatelessWidget {
  const GardenScreen({super.key});

  Future<void> _resetOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', false);
    if (context.mounted) {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt, color: Colors.white38),
            tooltip: "Debug: Reset Onboarding",
            onPressed: () => _resetOnboarding(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Streak Banner
                  Center(
                    child:
                        Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: colorScheme.onSurface.withOpacity(0.1),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "🔥",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "0 Day Streak",
                                    style: textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms)
                            .slideY(begin: -0.2, end: 0),
                  ),

                  const SizedBox(height: 32),

                  Text(
                    "Your Garden",
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onSurface,
                      letterSpacing: -0.5,
                    ),
                  ).animate().fadeIn(delay: 200.ms),

                  const SizedBox(height: 24),
                ],
              ),
            ),

            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll
                      .disallowIndicator(); // KILLS THE GREEN STRETCH DEAD
                  return true;
                },
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  itemCount: 3,
                  padding: const EdgeInsets.only(
                    bottom: 140,
                    left: 24,
                    right: 24,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 32),
                  itemBuilder: (context, shelfIndex) {
                    return Column(
                      children: [
                        // The Pots on the Shelf
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildEmptyPot(context, delay: shelfIndex * 100),
                            _buildEmptyPot(
                              context,
                              delay: (shelfIndex * 100) + 50,
                            ),
                            _buildEmptyPot(
                              context,
                              delay: (shelfIndex * 100) + 100,
                            ),
                          ],
                        ),
                        // The Premium Glass Shelf
                        Container(
                          height: 6,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            // Subtle gradient makes it look like light hitting a glass edge
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.onSurface.withOpacity(0.01),
                                colorScheme.onSurface.withOpacity(0.15),
                                colorScheme.onSurface.withOpacity(0.01),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(
                          delay: Duration(
                            milliseconds: 200 + (shelfIndex * 100),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90.0),
        child:
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Open Pomodoro Timer Sheet
              },
              icon: const Icon(Icons.timer_rounded),
              label: const Text("Start Focus Session"),
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
                elevation: 8,
                shadowColor: colorScheme.primary.withOpacity(0.4),
                textStyle: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ).animate().scaleXY(
              begin: 0.8,
              end: 1.0,
              curve: Curves.easeOutBack,
              delay: 600.ms,
            ),
      ),
    );
  }

  // Polished, premium glassmorphic "pot"
  // Polished, premium glassmorphic "pot"
  Widget _buildEmptyPot(BuildContext context, {required int delay}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
          width: 76,
          height: 76, // Made shorter and squarer for better proportions
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
              bottom: Radius.circular(24), // Softer taper
            ),
            color: colorScheme.onSurface.withOpacity(0.03), // Subtle base fill
            border: Border.all(
              color: colorScheme.onSurface.withOpacity(0.08),
              width: 1,
            ),
            // Removed the invalid BoxShadow from here
          ),
          child: Center(
            child: Icon(
              Icons.add_rounded,
              color: colorScheme.onSurface.withOpacity(0.15),
              size: 28,
            ),
          ),
        )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 300 + delay))
        .slideY(begin: 0.1, end: 0);
  }
}
