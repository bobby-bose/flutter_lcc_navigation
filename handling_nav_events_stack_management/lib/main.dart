import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        } else if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) => DetailsScreen());
        } else if (settings.name == '/settings') {
          return MaterialPageRoute(builder: (context) => SettingsScreen());
        } else {
          return MaterialPageRoute(builder: (context) => UnknownScreen());
        }
      },
      navigatorObservers: [MyNavigatorObserver()],
      home: HomeScreen(),
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('Route popped: ${route.settings.name}');
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to Details'),
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
            ),
            ElevatedButton(
              child: Text('Go to Settings'),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Unknown Screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/unknown');
          },
        ),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unknown')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Home'),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
          },
        ),
      ),
    );
  }
}
