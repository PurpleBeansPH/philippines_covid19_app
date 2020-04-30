/// Example of a combo time series chart with two series rendered as lines, and
/// a third rendered as points along the top line with a different color.
///
/// This example demonstrates a method for drawing points along a line using a
/// different color from the main series color. The line renderer supports
/// drawing points with the "includePoints" option, but those points will share
/// the same color as the line.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeCasesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TimeCasesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeCasesChart.withSampleData() {
    return new TimeCasesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(),
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesCases, DateTime>> _createSampleData() {
    final desktopSalesData = [
      new TimeSeriesCases(new DateTime(2017, 9, 19), 5),
      new TimeSeriesCases(new DateTime(2017, 9, 26), 25),
      new TimeSeriesCases(new DateTime(2017, 10, 3), 100),
      new TimeSeriesCases(new DateTime(2017, 10, 10), 75),
    ];

    final tableSalesData = [
      new TimeSeriesCases(new DateTime(2017, 9, 19), 10),
      new TimeSeriesCases(new DateTime(2017, 9, 26), 50),
      new TimeSeriesCases(new DateTime(2017, 10, 3), 200),
      new TimeSeriesCases(new DateTime(2017, 10, 10), 150),
    ];

    final mobileSalesData = [
      new TimeSeriesCases(new DateTime(2017, 9, 19), 10),
      new TimeSeriesCases(new DateTime(2017, 9, 26), 30),
      new TimeSeriesCases(new DateTime(2017, 10, 3), 80),
      new TimeSeriesCases(new DateTime(2017, 10, 10), 110),
    ];

    return [
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesCases sales, _) => sales.time,
        measureFn: (TimeSeriesCases sales, _) => sales.cases,
        data: desktopSalesData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesCases sales, _) => sales.time,
        measureFn: (TimeSeriesCases sales, _) => sales.cases,
        data: tableSalesData,
      ),
      new charts.Series<TimeSeriesCases, DateTime>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (TimeSeriesCases sales, _) => sales.time,
          measureFn: (TimeSeriesCases sales, _) => sales.cases,
          data: mobileSalesData)
    ];
  }
}

/// Sample time series data type.
class TimeSeriesCases {
  final DateTime time;
  final int cases;

  TimeSeriesCases(this.time, this.cases);
}