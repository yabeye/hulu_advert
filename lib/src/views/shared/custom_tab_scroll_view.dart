import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';

import 'package:hulu_advert/src/themes/themes.dart';
import 'package:hulu_advert/src/utils/constants.dart';

class CustomTabScrollView extends StatelessWidget {
  CustomTabScrollView({super.key, required this.children});
  final List<List<Widget>> children;
  final ui = Get.find<UIController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int tabIndex = ui.tabIndex.value;
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ui.tabIndex.value = 0;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              tab1Name,
                              style: TextStyle(
                                color: tabIndex != 0 ? Colors.black38 : null,
                              ),
                            ),
                          ),
                        ),
                        TabIndicator(isVisible: tabIndex == 0),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        ui.tabIndex.value = 1;
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              tab2Name,
                              style: TextStyle(
                                color: tabIndex != 1 ? Colors.black38 : null,
                              ),
                            ),
                          ),
                          TabIndicator(isVisible: tabIndex == 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: 10.height(),
          ),
          ...children[tabIndex],
        ],
      );
    });
  }
}

class TabIndicator extends StatelessWidget {
  const TabIndicator({
    super.key,
    required this.isVisible,
  });

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return !isVisible
        ? const SizedBox.shrink()
        : Container(
            width: context.width * .2,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultBorderRadiusSize),
                topRight: Radius.circular(defaultBorderRadiusSize),
              ),
            ),
          );
  }
}
