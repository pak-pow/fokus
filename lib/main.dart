import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// Theme
import 'app/theme.dart';

// App Config
import 'app/theme.dart';
import 'app/router.dart';

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
  final prefs = await SharedPreferences.getInstance();
  final hasCompletedOnboarding =
      prefs.getBool('hasCompletedOnboarding') ?? false;

  // Initialize Router
  final router = AppRouter.getRouter(hasCompletedOnboarding);

  runApp(FokusApp(router: router));
}

class FokusApp extends StatelessWidget {
  final GoRouter router;
  const FokusApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fokus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
