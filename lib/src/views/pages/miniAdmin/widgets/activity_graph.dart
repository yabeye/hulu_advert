import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/controllers/user_controller.dart';
import 'package:hulu_advert/src/extensions/date_extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:hulu_advert/src/extensions/num_extensions.dart';

class ActivityGraph extends StatelessWidget {
  ActivityGraph({super.key});

  final usersController = Get.find<UserController>();
  final productController = Get.find<ProductController>();
  final promotionController = Get.find<PromotionController>();

  List<DataPoint> _getPast10DayData(List<dynamic> feedData) {
    List<DataPoint> data = [];

    for (var i = 0; i < feedData.length; i++) {
      final current = feedData[i].createdAt!;
      int index = data.indexWhere((e) => e.date.isSameDay(current));
      data.add(DataPoint(current, index == -1 ? 1 : data[index].value + 1));
    }

    return data.where((dataPoint) {
      return dataPoint.date.difference(DateTime.now()).inDays.abs() <= 10;
    }).toList();
  }

  List<DataPoint> _getPast10DayUserData() {
    print(
        "User data is ${_getPast10DayData(usersController.feedUsers).map((e) => e.value)}");
    return _getPast10DayData(usersController.feedUsers);
  }

  List<DataPoint> _getPast10DayProductData() {
    return _getPast10DayData(productController.feedProducts);
  }

  List<DataPoint> _getPast10DayPromotionData() {
    return _getPast10DayData(promotionController.feedPromotions);
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
                  dataSource: _getPast10DayUserData(),
                  xValueMapper: (DataPoint dataPoint, _) => dataPoint.date,
                  yValueMapper: (DataPoint dataPoint, _) => dataPoint.value,
                  name: "Users",
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
