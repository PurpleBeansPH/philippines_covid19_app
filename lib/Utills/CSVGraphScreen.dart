import 'package:flutter/material.dart';
import 'package:philippinescovid19app/Utills/CSVReader.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CSVGraphScreen extends StatefulWidget {
  @override
  _CSVGraphScreenState createState() => _CSVGraphScreenState();
}

class _CSVGraphScreenState extends State<CSVGraphScreen> {
  List<charts.Series> seriesList;

  static List<charts.Series<LinearCases, int>> createData() {
    final data = [
      new LinearCases(0, 5),
      new LinearCases(1, 25),
      new LinearCases(2, 100),
      new LinearCases(3, 75),
    ];

    return [
      new charts.Series<LinearCases, int>(
        id: 'Cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearCases cases, _) => cases.date,
        measureFn: (LinearCases cases, _) => cases.amount,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList);
  }
}

class LinearCases {
  final int date;
  final int amount;

  LinearCases(this.date, this.amount);
}