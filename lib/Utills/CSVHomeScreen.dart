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
      Text("Coronavirus Cases:"),
      FutureBuilder<dynamic>(
        future: CSVReader().getTotalCases(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(snapshot.data.toString()),
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
      Text("Recovered:"),
      FutureBuilder<dynamic>(
        future: CSVReader().getCountTotalRecovered(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(snapshot.data.toString()),
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
      Text("Deaths:"),
      FutureBuilder<dynamic>(
        future: CSVReader().getCountTotalDied(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(snapshot.data.toString()),
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
