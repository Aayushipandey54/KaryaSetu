import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme.dart';
import 'shared/shell_page.dart';
import 'features/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await Hive.openBox('attendance_cache');
  runApp(const KaryasetuApp());
}

class KaryasetuApp extends StatelessWidget {
  const KaryasetuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karyasetu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.industrialTheme,
      // Logic: If token exists ? ShellPage : LoginPage
      home: const LoginPage(), 
    );
  }
}
