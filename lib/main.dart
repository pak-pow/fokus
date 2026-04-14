import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Ensure Flutter bindings are initialized before doing async work
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive local storage
  await Hive.initFlutter();

  // TODO: Register our generated Hive Adapters here next

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
      home: const Scaffold(
        body: Center(child: Text('Fokus MVP - Ready for UI')),
      ),
    );
  }
}
