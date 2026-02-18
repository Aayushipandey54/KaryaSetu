import 'package:equatable/equatable.dart';

class AttendanceRecord extends Equatable {
  final String userId;
  final String siteId;
  final double latitude;
  final double longitude;
  final DateTime timestamp;
  final String imageUrl;
  final String attendanceType;

  const AttendanceRecord({
    required this.userId,
    required this.siteId,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    required this.imageUrl,
    required this.attendanceType,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'site_id': siteId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
      'image_url': imageUrl,
      'attendance_type': attendanceType,
    };
  }

  @override
  List<Object?> get props => [userId, siteId, latitude, longitude, timestamp, imageUrl, attendanceType];
}
