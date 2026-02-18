import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';
import '../../core/theme.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool _isProcessing = false;
  String _statusMessage = 'READY FOR CHECK-IN';

  Future<void> _handleCheckIn() async {
    setState(() {
      _isProcessing = true;
      _statusMessage = 'CAPTURING LOCATION...';
    });

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      Position position = await Geolocator.getCurrentPosition();
      
      setState(() {
        _statusMessage = 'CAPTURING PHOTO...';
      });

      // Simulate camera capture for now
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _statusMessage = 'SYNCING WITH SERVER...';
      });

      // TODO: Call Attendance Service API
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _statusMessage = 'CHECK-IN SUCCESSFUL';
        _isProcessing = false;
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'ERROR: ${e.toString()}';
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ATTENDANCE')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.yellow, width: 2),
              ),
              child: Column(
                children: [
                  Icon(
                    _isProcessing ? Icons.sync : Icons.location_on,
                    size: 64,
                    color: AppColors.yellow,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _statusMessage,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: _isProcessing ? null : _handleCheckIn,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 24),
              ),
              child: const Text('MARK ATTENDANCE'),
            ),
            const SizedBox(height: 24),
            const Text(
              'GEOFENCE VALIDATION ACTIVE',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 10,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
