import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    bool isSmallScreen = screenWidth < 600;

    return Card(
      color: const Color(0xFF2A2A3E),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Category Distribution',
              style: TextStyle(
                fontSize: isSmallScreen ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),


            SizedBox(
              height: isSmallScreen ? screenHeight * 0.25 : 250,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 50,
                  sectionsSpace: 4,
                  borderData: FlBorderData(show: false),
                  sections: [
                    PieChartSectionData(
                      value: 45,
                      title: 'Electronics',
                      color: Colors.indigo,
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: 30,
                      title: 'Fashion',
                      color: Colors.orange,
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      value: 25,
                      title: 'Groceries',
                      color: Colors.green,
                      radius: 50,
                      titleStyle: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
