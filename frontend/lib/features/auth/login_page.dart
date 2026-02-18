import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../shared/shell_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'KARYASETU',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: AppColors.yellow,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'CONSTRUCTION SAFETY & PROGRESS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 64),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(color: AppColors.yellow),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'PASSWORD',
                labelStyle: TextStyle(color: AppColors.yellow),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (email == 'admin@karyasetu.com' && password == 'admin123') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const ShellPage()),
                  );
                } else if (email == 'worker@karyasetu.com' && password == 'worker123') {
                   Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const ShellPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('INVALID CREDENTIALS'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              child: const Text('LOGIN'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text(
                'REQUEST ACCESS',
                style: TextStyle(color: AppColors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
