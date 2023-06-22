import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/models/models.dart';
import 'package:video_player/video_player.dart';

import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';
import 'package:hulu_advert/src/views/shared/video_player_view.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({super.key, required this.promotion});
  final PromotionModel promotion;

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
                child: VideoPlayerView(
                  url: promotion.videoUrl!,
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
                  promotion.name ?? "",
                  style: textTheme.bodyLarge!.copyWith(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                5.height(),
                Text(
                  promotion.desc ?? "",
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
                            "${promotion.amount} available",
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
                            ((promotion.unitPrice ?? 0).toDouble())
                                .priceFormat(),
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
