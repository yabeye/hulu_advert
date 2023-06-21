import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';
import 'package:hulu_advert/src/views/shared/video_player_view.dart';

class PromotionCard extends StatefulWidget {
  const PromotionCard({
    super.key,
  });

  @override
  State<PromotionCard> createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard> {
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
          const Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadiusSize),
                  topRight: Radius.circular(defaultBorderRadiusSize),
                ),
                child: VideoPlayerView(
                  url:
                      'data/user/0/com.example.hulu_advert/cache/cb4ed5f4-f9af-4f36-88c7-d8683864b2d0/pexels-benjamin-hastings-17209196-960x540-30fps.mp4',
                  dataSourceType: DataSourceType.file,
                  autoPlay: false,
                ),
              ),
              // Positioned(
              //   top: 0,
              //   left: 0,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: AppColors.black.withAlpha(108),
              //       borderRadius: const BorderRadius.only(
              //         topLeft: Radius.circular(defaultBorderRadiusSize),
              //         bottomRight: Radius.circular(
              //           defaultBorderRadiusSize / 2,
              //         ),
              //       ),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(4.0),
              //       child: Text(
              //         "2.5 mB",
              //         style: textTheme.titleMedium!.copyWith(
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
