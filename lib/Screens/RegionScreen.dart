import 'package:flutter/material.dart';

class RegionScreen extends StatefulWidget {

  @override
  _RegionScreenState createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Philippines nCov App'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
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