import 'package:equatable/equatable.dart';

enum UserRole { worker, siteEngineer, architect, projectHead, admin }

class User extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final UserRole role;
  final String? siteId;

  const User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.siteId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['full_name'],
      role: _parseRole(json['role']),
      siteId: json['site_id'],
    );
  }

  static UserRole _parseRole(String role) {
    switch (role) {
      case 'Worker':
        return UserRole.worker;
      case 'Site Engineer':
        return UserRole.siteEngineer;
      case 'Architect':
        return UserRole.architect;
      case 'Project Head':
        return UserRole.projectHead;
      case 'Admin':
        return UserRole.admin;
      default:
        return UserRole.worker;
    }
  }

  @override
  List<Object?> get props => [id, email, fullName, role, siteId];
}
