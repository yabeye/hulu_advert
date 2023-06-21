import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/filter_controller.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';

import 'package:hulu_advert/src/views/shared/shared.dart';

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
    return CustomTabScrollView(
      children: [
        [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: searchController.searchKeyword,
                // focusNode: _usernameFocus,
                decoration: getInputDecoration(
                  "search ...",
                  prefixIcon: Icons.search,
                ),
                onFieldSubmitted: (v) {},
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return const Padding(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 16.0,
          //           vertical: 8,
          //         ),
          //         child: ProductCard(),
          //       );
          //     },
          //     childCount: 10,
          //   ),
          // ),
          SliverToBoxAdapter(
            child: StackLoader(
              // isLoading: true,
              child: Column(
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
          ),
        ],
        [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                // controller: _usernameController,
                // focusNode: _usernameFocus,
                decoration: getInputDecoration(
                  "search ...",
                  prefixIcon: Icons.search,
                ),
                onFieldSubmitted: (v) {},
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return const Padding(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 16.0,
          //           vertical: 8,
          //         ),
          //         child: PromotionCard(),
          //       );
          //     },
          //     childCount: 10,
          //   ),
          // ),

          SliverToBoxAdapter(
            child: StackLoader(
              // isLoading: true,
              child: Column(
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
                          : searchController.promotionSearchResult.isEmpty
                              ? "No Product(s) found!"
                              : "",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
