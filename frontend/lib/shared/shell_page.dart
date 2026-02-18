import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../features/dashboard/dashboard_page.dart';
import '../features/attendance/attendance_page.dart';
import '../features/ai_monitoring/ai_monitoring_page.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const AttendancePage(),
    const AIMonitoringPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: Colors.white24,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'DASHBOARD'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'ATTENDANCE'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'SAFETY'),
        ],
      ),
    );
  }
}
