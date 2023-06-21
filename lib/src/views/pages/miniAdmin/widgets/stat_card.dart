import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/themes.dart';
import 'package:hulu_advert/src/utils/utils.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Statistics",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        8.height(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatisticsCount(count: '10', label: 'Users'),
            StatisticsCount(count: '25', label: 'Products'),
            StatisticsCount(count: '20', label: 'Promotions'),
          ],
        ),
      ],
    );
  }
}

class StatisticsCount extends StatelessWidget {
  const StatisticsCount({
    super.key,
    required this.count,
    required this.label,
  });
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (context.width * .8) / 3,
      height: (context.width * .8) / 3,
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColor,
        borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
