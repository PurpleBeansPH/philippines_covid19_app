import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:philippinescovid19app/Utills/CSVGraphScreen.dart';

class GraphScreen extends StatefulWidget {

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  void onTabBar(int index) {
    switch (index) {
      case 0: {
        Navigator.pushReplacementNamed(context, 'Home');
        break;
      }
      case 1: {
        Navigator.pushReplacementNamed(context, 'Graph');
        break;
      }
      case 2: {
        Navigator.pushReplacementNamed(context, 'Region');
        break;
      }
      case 3: {
        Navigator.pushReplacementNamed(context, 'Testing');
        break;
      }
      case 4: {
        Navigator.pushReplacementNamed(context, 'Contact');
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Philippines nCov App'),
        ),
        body: CSVGraphScreen(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          onTap: onTabBar,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.show_chart),
              title: new Text('Chart'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.format_list_bulleted),
              title: new Text('Regions'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.local_hospital),
              title: new Text('Testing'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_pin),
              title: new Text('Contact'),
            )
          ],
        )
    );
  }
}