import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csv/csv.dart';

import './Screens/HomeScreen.dart';
import './Screens/GraphScreen.dart';
import './Screens/RegionScreen.dart';
import './Screens/TestingCenterScreen.dart';
import './Screens/ContactScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: 'Home',
      routes: {
        'Home': (context) => HomeScreen(),
        'Graph': (context) => GraphScreen(),
        'Region': (context) => RegionScreen(),
        'Testing': (context) => TestingCenterScreen(),
        'Contact': (context) => ContactScreen(),
      },
    );
  }
}