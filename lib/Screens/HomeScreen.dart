import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTabBar(int index) {
    switch (index) {
      case 0: {
        Navigator.pushNamed(context, 'Home');
        break;
      }
      case 1: {
        Navigator.pushNamed(context, 'Graph');
        break;
      }
      case 2: {
        Navigator.pushNamed(context, 'Region');
        break;
      }
      case 3: {
        Navigator.pushNamed(context, 'Testing');
        break;
      }
      case 4: {
        Navigator.pushNamed(context, 'Contact');
        break;
      }
    }
  }

  Widget buildColumn() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text("Coronavirus Cases:"),
      Text("0"),
      Text("Recovered:"),
      Text("0"),
      Text("Deaths:"),
      Text("0"),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Philippines nCov App'),
      ),
      body: Center(child: buildColumn()),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
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
