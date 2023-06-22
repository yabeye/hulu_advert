import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/product_controller.dart';
import 'package:hulu_advert/src/controllers/promotion_controller.dart';
import 'package:hulu_advert/src/controllers/user_controller.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/repositories/repositories.dart';
import 'package:hulu_advert/src/themes/themes.dart';
import 'package:hulu_advert/src/utils/utils.dart';

class StatCard extends StatefulWidget {
  const StatCard({super.key});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Statistics",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          8.height(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatisticsCount(
                count: Get.find<UserController>().feedUsers.length.toString(),
                label: 'Users',
              ),
              StatisticsCount(
                  count: Get.find<ProductController>()
                      .feedProducts
                      .length
                      .toString(),
                  label: 'Products'),
              StatisticsCount(
                count: Get.find<PromotionController>()
                    .feedPromotions
                    .length
                    .toString(),
                label: 'Promotions',
              ),
            ],
          ),
        ],
      ),
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
