import 'package:flutter/material.dart';

import './HomeScreen.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: Center(
          child: RaisedButton(
              child: Text('Go to Second Screen'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  )))),
    );
  }
}

