import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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

  _launchURL() async {
    const url = 'https://drive.google.com/drive/folders/10VkiUA8x7TS2jkibhSZK1gmWxFM-EoZP';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildColumn() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text("App Made By: PurpleBeansPH"),
      Text("Data used: DOH COVID-19 DataDrop"),
      RaisedButton(
        onPressed: _launchURL,
        child: Text('DOH Datadrop Google Drive Page'),
      ),
    ],
  );

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
          currentIndex: 4,
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