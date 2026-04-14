import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/onboarding_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocConsumer<OnboardingCubit, int>(
          listener: (context, state) {
            // Animate to the new page when the cubit state changes
            _pageController.animateToPage(
              state,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOutCubic,
            );
          },
          builder: (context, state) {
            return PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // Forces the use of our custom buttons
              children: const [
                Center(child: Text("Screen 1: The Mirror")),
                Center(child: Text("Screen 2: The Cost")),
                Center(child: Text("Screen 3: The Possibility")),
                Center(child: Text("Screen 4: The Promise")),
                Center(child: Text("Screen 5: The Seed")),
              ],
            );
          },
        ),
      ),
    );
  }
}