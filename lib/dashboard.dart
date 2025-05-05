import 'package:flutter/material.dart';
import 'linechart.dart';
import 'piechart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int chartType = 0;
  bool isDarkMode = false;


  Widget getChart() {
    if (chartType == 0) {
      return const LineChartWidget();
    } else {
      return const PieChartWidget();
    }
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final isLargeScreen = mediaQuery.size.width > 600;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {

            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF1F1F2E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Egosta Devlogs', // Replace with dynamic username
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.white),
              title: const Text('Dashboard', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.report, color: Colors.white),
              title: const Text('Reports', style: TextStyle(color: Colors.white)),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(mediaQuery.size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatsCard(label: 'Total Users', value: '1,245'),
                  StatsCard(label: 'Active Users', value: '1,000'),
                  StatsCard(label: 'Revenue', value: '\$12,500'),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        chartType = 0;
                      });
                    },
                    child: const Text('Line Chart'),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        chartType = 1; // Show Pie Chart
                      });
                    },
                    child: const Text('Pie Chart'),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),


              getChart(),

              SizedBox(height: mediaQuery.size.height * 0.02),


              Card(
                color: const Color(0xFF1F1F2E),
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(mediaQuery.size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent Activity',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: mediaQuery.size.height * 0.01),
                      const Text('You have 3 new tasks to complete today.',
                          style: TextStyle(color: Colors.white70)),
                      SizedBox(height: mediaQuery.size.height * 0.01),
                      const Text('5 new reports were generated in the last hour.',
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// StatsCard widget to display stats in a card
class StatsCard extends StatelessWidget {
  final String label;
  final String value;

  const StatsCard({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Card(
      color: const Color(0xFF1F1F2E),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(mediaQuery.size.width * 0.04),
        child: Column(
          children: [
            Text(label, style: TextStyle(color: Colors.white70,
                fontSize: mediaQuery.size.width * 0.04)),
            Text(value, style: TextStyle(color: Colors.white,
                fontSize: mediaQuery.size.width * 0.05, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
