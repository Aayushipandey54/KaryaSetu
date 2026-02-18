import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PROJECT ANALYTICS')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatGrid(),
            const SizedBox(height: 32),
            _buildChartHeader('SAFETY TRENDS'),
            _buildLineChart(),
            const SizedBox(height: 32),
            _buildChartHeader('WORKER ATTENDANCE (LAST 7 DAYS)'),
            _buildBarChart(),
            const SizedBox(height: 32),
            _buildProjectSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('TOTAL WORKERS', '142', AppColors.yellow),
        _buildStatCard('PRESENT TODAY', '128', Colors.green),
        _buildStatCard('SAFETY SCORE', '88%', AppColors.yellow),
        _buildStatCard('RISK ALERTS', '03', Colors.red),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }

  Widget _buildChartHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.white54),
      ),
    );
  }

  Widget _buildLineChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: true, border: Border.all(color: Colors.white10)),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3), FlSpot(1, 4), FlSpot(2, 3.5), FlSpot(3, 5), FlSpot(4, 4.8),
              ],
              isCurved: true,
              color: AppColors.yellow,
              barWidth: 4,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: AppColors.yellow, width: 16)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: AppColors.yellow, width: 16)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14, color: AppColors.yellow, width: 16)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 12, color: AppColors.yellow, width: 16)]),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.black,
        border: Border.all(color: AppColors.yellow),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PROJECT ALPHA', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              Text('SITE ID: SC-4032', style: TextStyle(fontSize: 10, color: Colors.white54)),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('45%', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.yellow, fontSize: 24)),
              Text('PROGRESS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
