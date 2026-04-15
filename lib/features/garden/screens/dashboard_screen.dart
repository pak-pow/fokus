import 'package:flutter/material.dart';
import 'garden_screen.dart';
import '../../tasks/screens/tasks_screen.dart';
import '../../settings/screens/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    GardenScreen(),
    TasksScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      extendBody:
          true, // Allows the body to flow underneath the transparent nav bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface.withOpacity(0.8), // Semi-transparent
          border: Border(
            top: BorderSide(
              color: colorScheme.onSurface.withOpacity(0.05),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: colorScheme.primary, // Deep organic green
          unselectedItemColor: colorScheme.onSurface.withOpacity(0.4),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.eco_rounded),
              label: 'Garden',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_kanban_rounded),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
