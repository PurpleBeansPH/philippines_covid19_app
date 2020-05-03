import 'package:flutter/material.dart';
import 'package:philippinescovid19app/Utills/CSVReader.dart';

class CSVHomeScreen extends StatefulWidget {
  @override
  _CSVHomeScreenState createState() => _CSVHomeScreenState();
}

class _CSVHomeScreenState extends State<CSVHomeScreen> {
  Widget buildColumn() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text("Last Update" , style: TextStyle(fontSize: 30)),
      Text("May 1" , style: TextStyle(fontSize: 30)),
      Text("Total Coronavirus Cases:" , style: TextStyle(fontSize: 30)),
      FutureBuilder<dynamic>(
        future: CSVReader().getTotalCases(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(snapshot.data.toString(), style: TextStyle(fontSize: 30)),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
      Text("Recovered:", style: TextStyle(fontSize: 30, color: Colors.lightGreen)),
      FutureBuilder<dynamic>(
        future: CSVReader().getCountTotalRecovered(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(snapshot.data.toString(), style: TextStyle(fontSize: 30, color: Colors.lightGreen)),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
      Text("Deaths:", style: TextStyle(fontSize: 30, color: Colors.redAccent)),
      FutureBuilder<dynamic>(
        future: CSVReader().getCountTotalDied(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(snapshot.data.toString(),style: TextStyle(fontSize: 30, color: Colors.redAccent)),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: buildColumn())
    );
  }
}
