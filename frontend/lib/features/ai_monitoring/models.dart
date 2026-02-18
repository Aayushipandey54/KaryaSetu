import 'package:equatable/equatable.dart';

class AIResult extends Equatable {
  final bool helmetDetected;
  final bool vestDetected;
  final double riskScore;
  final String progressEstimate;
  final String aiSummary;
  final List<String> anomalies;

  const AIResult({
    required this.helmetDetected,
    required this.vestDetected,
    required this.riskScore,
    required this.progressEstimate,
    required this.aiSummary,
    required this.anomalies,
  });

  factory AIResult.fromJson(Map<String, dynamic> json) {
    return AIResult(
      helmetDetected: json['helmet_detected'],
      vestDetected: json['vest_detected'],
      riskScore: json['risk_score'].toDouble(),
      progressEstimate: json['progress_estimate'],
      aiSummary: json['ai_summary'],
      anomalies: List<String>.from(json['anomalies'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
    helmetDetected, vestDetected, riskScore, progressEstimate, aiSummary, anomalies
  ];
}
