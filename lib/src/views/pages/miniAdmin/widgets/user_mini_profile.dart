import 'package:flutter/material.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/utils.dart';

class UserMiniProfile extends StatelessWidget {
  const UserMiniProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.superLightGray,
        borderRadius: BorderRadius.circular(defaultBorderRadiusSize),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    board1,
                    width: 100,
                    height: 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yeabsera B.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "@yabeye   •   ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "+251 901 23 4569",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    20.height(),
                  ],
                ),
              ],
            ),
            10.height(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "My Products",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "4",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Container(
                  width: 2,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.black.withAlpha(108),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "My Promotions",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "8",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            ),
            20.height(),
          ],
        ),
      ),
    );
  }
}
