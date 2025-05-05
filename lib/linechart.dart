import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  String selectedFilter = 'This Week';
  bool isLoading = false;

  final List<String> filters = ['Today', 'This Week', 'This Month'];

  final Map<String, List<FlSpot>> chartData = {
    'Today': [
      FlSpot(1, 5),
      FlSpot(2, 3),
      FlSpot(3, 4),
      FlSpot(4, 7),
      FlSpot(5, 6),
    ],
    'This Week': [
      FlSpot(1, 3),
      FlSpot(2, 5),
      FlSpot(3, 2),
      FlSpot(4, 8),
      FlSpot(5, 4),
      FlSpot(6, 6),
      FlSpot(7, 7),
    ],
    'This Month': [
      FlSpot(1, 2),
      FlSpot(5, 5),
      FlSpot(10, 3),
      FlSpot(15, 7),
      FlSpot(20, 6),
      FlSpot(25, 8),
      FlSpot(30, 4),
    ],
  };

  void updateChart(String filter) async {
    setState(() {
      selectedFilter = filter;
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 600));

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive design
    double width = MediaQuery.of(context).size.width;
    bool isSmallScreen = width < 600;

    return Card(
      color: const Color(0xFF1F1F2E),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Growth Chart',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedFilter,
                  dropdownColor: Colors.black,
                  style: const TextStyle(color: Colors.white),
                  underline: Container(),
                  iconEnabledColor: Colors.white,
                  items: filters.map((filter) {
                    return DropdownMenuItem(
                      value: filter,
                      child: Text(filter),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      updateChart(value);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Chart or Loader
            SizedBox(
              height: isSmallScreen ? 250 : 250,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.white))
                  : LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: chartData[selectedFilter]!,
                      isCurved: true,
                      color: Colors.cyanAccent,
                      barWidth: 4,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.cyanAccent.withOpacity(0.2),
                      ),
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
