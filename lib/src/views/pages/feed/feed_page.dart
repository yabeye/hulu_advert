import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/controllers/product_controller.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/themes/themes.dart';
import 'package:hulu_advert/src/utils/constants.dart';
import 'package:hulu_advert/src/views/pages/product/widgets/widgets.dart';
import 'package:hulu_advert/src/views/pages/promotion/widgets/widgets.dart';

import 'package:hulu_advert/src/views/shared/shared.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final _productController = Get.find<ProductController>();
  final _promotionController = Get.find<PromotionController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => CustomTabScrollView(
        children: [
          [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: ProductCard(
                      product: _productController.feedProducts[index],
                    ),
                  );
                },
                childCount: _productController.feedProducts.length,
              ),
            ),
            SliverToBoxAdapter(
              child: _productController.feedProducts.isNotEmpty
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(height: context.height * .3),
                        Image.asset(
                          board1,
                          height: context.height * .2,
                          color: AppColors.gray,
                        ),
                        10.height(),
                        const Center(
                          child: Text(
                            "No product(s) available",
                          ),
                        ),
                      ],
                    ),
            ),
          ],
          [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: PromotionCard(
                      promotion: _promotionController.feedPromotions[index],
                    ),
                  );
                },
                childCount: _promotionController.feedPromotions.length,
              ),
            ),
            SliverToBoxAdapter(
              child: _promotionController.feedPromotions.isNotEmpty
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(height: context.height * .3),
                        Image.asset(
                          board1,
                          height: context.height * .2,
                          color: AppColors.gray,
                        ),
                        10.height(),
                        const Center(
                          child: Text(
                            "No promotion(s) available",
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ],
      ),
    );
  }
}
