import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Domain Enums
import 'domain/enums/plant_type.dart';
import 'domain/enums/skill_tag.dart';
import 'domain/enums/task_status.dart';

// Data Models
import 'data/models/plant_model.dart';
import 'data/models/task_model.dart';
import 'data/models/session_model.dart';
import 'data/models/streak_model.dart';

// features
import 'features/onboarding/screens/onboarding_screen.dart';

void main() async {
  // Ensure Flutter bindings are initialized before doing async work
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive local storage
  await Hive.initFlutter();

  // 1. Register Enums
  Hive.registerAdapter(TaskStatusAdapter());
  Hive.registerAdapter(SkillTagAdapter());
  Hive.registerAdapter(PlantTypeAdapter());

  // 2. Register Models
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(PlantModelAdapter());
  Hive.registerAdapter(SessionModelAdapter());
  Hive.registerAdapter(StreakModelAdapter());

  // 3. Open the required boxes (tables)
  await Hive.openBox<TaskModel>('tasks');
  await Hive.openBox<PlantModel>('plants');
  await Hive.openBox<SessionModel>('sessions');
  await Hive.openBox<StreakModel>('streak');

  runApp(const FokusApp());
}

class FokusApp extends StatelessWidget {
  const FokusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fokus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E5B32),
        ), // Dark organic green
        useMaterial3: true,
        fontFamily: 'Plus Jakarta Sans',
      ),
      home: const OnboardingScreen(),
    );
  }
}
