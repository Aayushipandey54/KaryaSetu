import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class AttendanceCache extends HiveObject {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final double latitude;
  @HiveField(2)
  final double longitude;
  @HiveField(3)
  final DateTime timestamp;
  @HiveField(4)
  final bool isSynced;

  AttendanceCache({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.isSynced = false,
  });
}

// Note: In a real project, we would run build_runner to generate the adapter
// For this structure, we define the model used with Hive.
