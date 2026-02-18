import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'models.dart';

class AIMonitoringPage extends StatefulWidget {
  const AIMonitoringPage({super.key});

  @override
  State<AIMonitoringPage> createState() => _AIMonitoringPageState();
}

class _AIMonitoringPageState extends State<AIMonitoringPage> {
  bool _isAnalyzing = false;
  AIResult? _result;

  Future<void> _captureAndAnalyze() async {
    setState(() {
      _isAnalyzing = true;
    });

    // Simulate API call to AI Service
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _result = const AIResult(
        helmetDetected: true,
        vestDetected: false,
        riskScore: 0.72,
        progressEstimate: '45%',
        aiSummary: 'Safety alert: Workers detected without safety vests. Project at 45% completion.',
        anomalies: ['Missing Safety Vest', 'Unsafe grouping'],
      );
      _isAnalyzing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI SAFETY MONITOR')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_result == null && !_isAnalyzing)
              _buildUploadPlaceholder()
            else if (_isAnalyzing)
              _buildAnalyzingState()
            else
              _buildResults(),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _isAnalyzing ? null : _captureAndAnalyze,
              icon: const Icon(Icons.camera_alt),
              label: const Text('UPLOAD SITE IMAGE'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadPlaceholder() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.yellow, style: BorderStyle.solid),
      ),
      child: const Center(
        child: Text(
          'NO IMAGE ANALYZED',
          style: TextStyle(color: Colors.white24, letterSpacing: 2),
        ),
      ),
    );
  }

  Widget _buildAnalyzingState() {
    return const Column(
      children: [
        LinearProgressIndicator(color: AppColors.yellow, backgroundColor: Colors.black),
        SizedBox(height: 16),
        Text('RUNNING COMPUTER VISION MODELS...', style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildResultCard('HELMET DETECTION', _result!.helmetDetected ? 'SECURE' : 'FAIL', _result!.helmetDetected),
        const SizedBox(height: 12),
        _buildResultCard('SAFETY VEST', _result!.vestDetected ? 'SECURE' : 'FAIL', _result!.vestDetected),
        const SizedBox(height: 24),
        Text('RISK SCORE: ${(_result!.riskScore * 100).toInt()}%', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text('PROGRESS ESTIMATE: ${_result!.progressEstimate}', style: const TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.lightGrey,
          child: Text(_result!.aiSummary, style: const TextStyle(height: 1.5)),
        ),
      ],
    );
  }

  Widget _buildResultCard(String title, String status, bool success) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: success ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        border: Border.all(color: success ? Colors.green : Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(status, style: TextStyle(fontWeight: FontWeight.bold, color: success ? Colors.green : Colors.red)),
        ],
      ),
    );
  }
}
