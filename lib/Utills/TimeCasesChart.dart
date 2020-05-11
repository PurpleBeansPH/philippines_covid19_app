/// Example of a combo time series chart with two series rendered as lines, and
/// a third rendered as points along the top line with a different color.
///
/// This example demonstrates a method for drawing points along a line using a
/// different color from the main series color. The line renderer supports
/// drawing points with the "includePoints" option, but those points will share
/// the same color as the line.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeCasesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TimeCasesChart(this.seriesList, {this.animate});

  factory TimeCasesChart.withData(Map timeCasesMap) {
    return new TimeCasesChart(
      _addData(timeCasesMap),
      // Disable animations for image tests.
      animate: true,
    );
  }

  static List<charts.Series<TimeSeriesCases, DateTime>> _addData(
      Map timeCasesMap) {
    List<DateTime> caseDateList = [];

    var format1 = new DateFormat("yyyy-MM-dd");
    var dateList = timeCasesMap.keys.toList();

    for (int i = 0; i < dateList.length; i++) {
      caseDateList.add(format1.parse(dateList[i]));
    }
    caseDateList.sort((a, b) => a.compareTo(b));

    var formatter = new DateFormat('yyyy-MM-dd');
    List<String> dateSortList = [];
    for (int f = 0; f < dateList.length; f++) {
      dateSortList.add(formatter.format(caseDateList[f]));
    }

    List<TimeSeriesCases> totalCasesData = [];

    for (int h = 0; h < dateSortList.length; h++) {
      totalCasesData.add(
          new TimeSeriesCases(caseDateList[h], timeCasesMap[dateSortList[h]]));
    }

    return [
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'TotalCases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesCases cases, _) => cases.date,
        measureFn: (TimeSeriesCases cases, _) => cases.amount,
        data: totalCasesData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
        animate: animate,
        defaultInteractions: false,
        defaultRenderer: new charts.BarRendererConfig<DateTime>(),
        dateTimeFactory: const charts.LocalDateTimeFactory(),
        behaviors: [
          new charts.SlidingViewport(),
          new charts.PanAndZoomBehavior(),
          new charts.ChartTitle('Daily Cases Timeline',
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.middle,
              innerPadding: 18),
          new charts.ChartTitle('Cases',
              behaviorPosition: charts.BehaviorPosition.start,
              titleOutsideJustification:
                  charts.OutsideJustification.middleDrawArea),
          new charts.ChartTitle('Date',
              behaviorPosition: charts.BehaviorPosition.bottom,
              titleOutsideJustification: charts.OutsideJustification.middle),
        ]

    );
  }
}

/// Sample time series data type.
class TimeSeriesCases {
  final DateTime date;
  final int amount;

  TimeSeriesCases(this.date, this.amount);
}
