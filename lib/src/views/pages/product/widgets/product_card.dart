import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

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
              Image.asset(board1),
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
              )
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
                  "Gaming laptop with free keyboard and mouse",
                  style: textTheme.bodyLarge!.copyWith(
                      // color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
