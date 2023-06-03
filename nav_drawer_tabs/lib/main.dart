import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Drawer and Tabs Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToScreen(String screenName) {
    Navigator.pop(context); // Close the drawer
    // Perform navigation based on the selected screen
    if (screenName == 'Screen 1') {
      // Handle navigation to Screen 1
    } else if (screenName == 'Screen 2') {
      // Handle navigation to Screen 2
    } else if (screenName == 'Screen 3') {
      // Handle navigation to Screen 3
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Drawer and Tabs')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Screen 1',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => _navigateToScreen('Screen 1'),
            ),
            ListTile(
              title: Text('Screen 2', style: TextStyle(color: Colors.black)),
              onTap: () => _navigateToScreen('Screen 2'),
            ),
            ListTile(
              title: Text('Screen 3', style: TextStyle(color: Colors.black)),
              onTap: () => _navigateToScreen('Screen 3'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'Tab 1',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Tab 2',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Tab 3',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.red,
                  child: Center(child: Text('Tab 1 content')),
                ),
                Container(
                  color: Colors.green,
                  child: Center(child: Text('Tab 2 content')),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(child: Text('Tab 3 content')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
