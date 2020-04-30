import 'package:flutter/material.dart';
import 'package:philippinescovid19app/Utills/CSVReader.dart';

class CSVRegionScreen extends StatefulWidget {
  @override
  _CSVRegionScreenState createState() => _CSVRegionScreenState();
}

class _CSVRegionScreenState extends State<CSVRegionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(crossAxisCount: 2, children: [
        FutureBuilder<dynamic>(
          future: CSVReader().getCountTotalRecovered(),
          // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Recovered: ${snapshot.data}', style: TextStyle(fontSize: 20, color: Colors.lightGreen)),
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
        FutureBuilder<dynamic>(
          future: CSVReader().getCountTotalDied(),
          // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Died: ${snapshot.data}', style: TextStyle(fontSize: 20, color: Colors.redAccent)),
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
        FutureBuilder<dynamic>(
          future: CSVReader().getTotalCases(),
          // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Total Cases: ${snapshot.data}', style: TextStyle(fontSize: 20)),
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
        FutureBuilder<dynamic>(
          future: CSVReader().getTotalAdmitted(),
          // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Currently Admitted: ${snapshot.data}', style: TextStyle(fontSize: 15)),
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
        )
      ]),
    );
  }
}
