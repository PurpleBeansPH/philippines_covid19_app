import 'package:flutter/material.dart';
import 'package:philippinescovid19app/Utills/CSVReader.dart';
import 'package:philippinescovid19app/Utills/TimeCasesChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CSVGraphScreen extends StatefulWidget {
  @override
  _CSVGraphScreenState createState() => _CSVGraphScreenState();
}

class _CSVGraphScreenState extends State<CSVGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FutureBuilder<dynamic>(
        future: CSVReader().getDateOfCases(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
                Expanded(flex: 5, child: TimeCasesChart.withData(snapshot.data))
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
                child: Text('Building Graph'),
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
    );
  }
}

class LinearCases {
  final int date;
  final int amount;

  LinearCases(this.date, this.amount);
}