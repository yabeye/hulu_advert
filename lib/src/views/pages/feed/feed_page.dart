import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/product_controller.dart';
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
          ],
          [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: PromotionCard(),
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
