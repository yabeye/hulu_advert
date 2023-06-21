import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';
import 'package:hulu_advert/src/views/shared/custom_carousel_slider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int currentIndex = 0;
  int count = 5;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
        color: AppColors.superLightGray,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadiusSize),
                  topRight: Radius.circular(defaultBorderRadiusSize),
                ),
                child: CustomCarouselSlider(
                  imageUrls: const [
                    board1,
                    imgTShirt,
                    board3,
                  ],
                  currentIndex: currentIndex,
                  onPageChanged: (v) {
                    currentIndex = v;
                    setState(() {});
                  },
                  height: 400,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.black.withAlpha(108),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(defaultBorderRadiusSize),
                      bottomRight: Radius.circular(
                        defaultBorderRadiusSize / 2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "22.5 kb",
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.black.withAlpha(108),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(defaultBorderRadiusSize),
                      bottomLeft: Radius.circular(
                        defaultBorderRadiusSize / 2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      "$currentIndex / $count",
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            // color: AppColors.,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Men t-shirt from happy store",
                  style: textTheme.bodyLarge!.copyWith(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                5.height(),
                Text(
                  "Best Quality men t shirt , full cotton , brand new and european standard",
                  style: textTheme.bodySmall!.copyWith(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: context.width * .4,
                    child: const Divider(),
                  ),
                ),
                5.height(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.store),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "52 available",
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.money_off_csred),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            (2500.00).priceFormat(),
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
