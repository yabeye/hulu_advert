import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/filter_controller.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';
import 'package:hulu_advert/src/views/pages/product/widgets/product_card.dart';

import 'package:hulu_advert/src/views/shared/shared.dart';

import '../promotion/widgets/promotion_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(() => CustomTabScrollView(
          tab1Badge: searchController.productSearchResult.length,
          tab2Badge: searchController.promotionSearchResult.length,
          children: [
            [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: searchController.searchKeyword,
                    decoration: getInputDecoration(
                      "search ...",
                      prefixIcon: Icons.search,
                    ),
                    onChanged: (_) => searchController.search(),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: ProductCard(
                        product: searchController.productSearchResult[index],
                      ),
                    );
                  },
                  childCount: searchController.productSearchResult.length,
                ),
              ),
              SliverToBoxAdapter(
                child: searchController.productSearchResult.isNotEmpty
                    ? Container()
                    : Column(
                        children: [
                          SizedBox(height: context.height * .1),
                          Image.asset(
                            searchController.searchKeyword.value.text.isEmpty
                                ? imgSearching
                                : board1,
                            height: context.height * .2,
                            color: AppColors.gray,
                          ),
                          10.height(),
                          Center(
                            child: Text(
                              searchController.searchKeyword.value.text.isEmpty
                                  ? "Search Products and Promotion"
                                  : searchController.productSearchResult.isEmpty
                                      ? "No Product(s) found!"
                                      : "Search Products and Promotion",
                            ),
                          ),
                        ],
                      ),
              ),
            ],
            [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: searchController.searchKeyword,
                    decoration: getInputDecoration(
                      "search ...",
                      prefixIcon: Icons.search,
                    ),
                    onChanged: (v) => searchController.search(),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: PromotionCard(
                        promotion:
                            searchController.promotionSearchResult[index],
                      ),
                    );
                  },
                  childCount: searchController.promotionSearchResult.length,
                ),
              ),
              SliverToBoxAdapter(
                child: searchController.promotionSearchResult.isNotEmpty
                    ? Container()
                    : Column(
                        children: [
                          SizedBox(height: context.height * .1),
                          Image.asset(
                            searchController.searchKeyword.value.text.isEmpty
                                ? imgSearching
                                : board1,
                            height: context.height * .2,
                            color: AppColors.gray,
                          ),
                          10.height(),
                          Center(
                            child: Text(
                              searchController.searchKeyword.value.text.isEmpty
                                  ? "Search Products and Promotion"
                                  : searchController
                                          .promotionSearchResult.isEmpty
                                      ? "No Product(s) found!"
                                      : "",
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ],
        ));
  }
}
