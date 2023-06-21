import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:hulu_advert/src/extensions/num_extensions.dart';

class ActivityGraph extends StatelessWidget {
  const ActivityGraph({super.key});

  List<DataPoint> _getPastTenDaysData() {
    List<DataPoint> data = [
      DataPoint(DateTime.now().subtract(const Duration(days: 9)), 2),
      DataPoint(DateTime.now().subtract(const Duration(days: 8)), 5),
      DataPoint(DateTime.now().subtract(const Duration(days: 7)), 8),
      DataPoint(DateTime.now().subtract(const Duration(days: 6)), 12),
      DataPoint(DateTime.now().subtract(const Duration(days: 5)), 15),
      DataPoint(DateTime.now().subtract(const Duration(days: 4)), 16),
      DataPoint(DateTime.now().subtract(const Duration(days: 3)), 20),
      DataPoint(DateTime.now().subtract(const Duration(days: 2)), 25),
      DataPoint(DateTime.now().subtract(const Duration(days: 1)), 26),
      DataPoint(DateTime.now(), 30),
    ];

    List<DataPoint> pastTenDaysData = data.where((dataPoint) {
      return dataPoint.date.difference(DateTime.now()).inDays.abs() <= 10;
    }).toList();

    return pastTenDaysData;
  }

  List<DataPoint> _getPast10DayProductData() {
    List<DataPoint> data = [
      DataPoint(DateTime.now().subtract(const Duration(days: 9)), 30),
      DataPoint(DateTime.now().subtract(const Duration(days: 8)), 35),
      DataPoint(DateTime.now().subtract(const Duration(days: 7)), 40),
      DataPoint(DateTime.now().subtract(const Duration(days: 6)), 56),
      DataPoint(DateTime.now().subtract(const Duration(days: 5)), 60),
      DataPoint(DateTime.now().subtract(const Duration(days: 4)), 75),
      DataPoint(DateTime.now().subtract(const Duration(days: 3)), 70),
      DataPoint(DateTime.now().subtract(const Duration(days: 2)), 80),
      DataPoint(DateTime.now().subtract(const Duration(days: 1)), 120),
      DataPoint(DateTime.now(), 150),
    ];

    List<DataPoint> pastTenDaysData = data.where((dataPoint) {
      return dataPoint.date.difference(DateTime.now()).inDays.abs() <= 10;
    }).toList();

    return pastTenDaysData;
  }

  List<DataPoint> _getPast10DayPromotionData() {
    List<DataPoint> data = [
      DataPoint(DateTime.now().subtract(const Duration(days: 9)), 20),
      DataPoint(DateTime.now().subtract(const Duration(days: 8)), 25),
      DataPoint(DateTime.now().subtract(const Duration(days: 7)), 30),
      DataPoint(DateTime.now().subtract(const Duration(days: 6)), 35),
      DataPoint(DateTime.now().subtract(const Duration(days: 5)), 45),
      DataPoint(DateTime.now().subtract(const Duration(days: 4)), 40),
      DataPoint(DateTime.now().subtract(const Duration(days: 3)), 45),
      DataPoint(DateTime.now().subtract(const Duration(days: 2)), 40),
      DataPoint(DateTime.now().subtract(const Duration(days: 1)), 50),
      DataPoint(DateTime.now(), 60),
    ];

    List<DataPoint> pastTenDaysData = data.where((dataPoint) {
      return dataPoint.date.difference(DateTime.now()).inDays.abs() <= 10;
    }).toList();

    return pastTenDaysData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Activity (past 10 days)",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        5.height(),
        SizedBox(
            height: 300,
            child: SfCartesianChart(
              tooltipBehavior: TooltipBehavior(
                enable: true,
                header: 'Hulu Advert Data',
                format: 'point.x : point.y',
              ),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              primaryXAxis: DateTimeAxis(),
              series: <LineSeries<DataPoint, DateTime>>[
                LineSeries<DataPoint, DateTime>(
                  dataSource: _getPastTenDaysData(),
                  xValueMapper: (DataPoint dataPoint, _) => dataPoint.date,
                  yValueMapper: (DataPoint dataPoint, _) => dataPoint.value,
                  name: "Total number of users",
                ),
                LineSeries<DataPoint, DateTime>(
                  dataSource: _getPast10DayProductData(),
                  xValueMapper: (DataPoint dataPoint, _) => dataPoint.date,
                  yValueMapper: (DataPoint dataPoint, _) => dataPoint.value,
                  name: "Products",
                ),
                LineSeries<DataPoint, DateTime>(
                  dataSource: _getPast10DayPromotionData(),
                  xValueMapper: (DataPoint dataPoint, _) => dataPoint.date,
                  yValueMapper: (DataPoint dataPoint, _) => dataPoint.value,
                  name: "Promotion",
                ),
              ],
            )),
      ],
    );
  }
}

class DataPoint {
  final DateTime date;
  final double value;

  DataPoint(this.date, this.value);
}
