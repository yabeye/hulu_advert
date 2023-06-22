import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'package:hulu_advert/src/controllers/promotion_controller.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/themes/themes.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:hulu_advert/src/views/shared/video_player_view.dart';

class AddPromotionVideoSection extends StatelessWidget {
  AddPromotionVideoSection({super.key});

  final _promotion = Get.find<PromotionController>();

  _pickPromotionVideo() async {
    XFile? selectedVideo = await Common.pickVideo();

    if (selectedVideo == null) {
      return;
    }

    _promotion.videoFile = File(selectedVideo.path);
    debugPrint("Selected Size: ${_promotion.videoFile!.sizeInmB()}");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionController>(builder: (c) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Promotion Video",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            // 5.height(),
            Text(
              "You can only upload up to $promotionVideoMaxSize mB",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            20.height(),
            SizedBox(
              child: _promotion.videoFile != null
                  ? ClipRRect(
                      borderRadius:
                          BorderRadius.circular(defaultBorderRadiusSize),
                      child: VideoPlayerView(
                        url: _promotion.videoFile!.path,
                        dataSourceType: DataSourceType.file,
                      ),
                    )
                  : InkWell(
                      onTap: _pickPromotionVideo,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(defaultBorderRadiusSize),
                        dashPattern: const [4, 4],
                        color: AppColors.kSecondaryColor,
                        borderPadding: const EdgeInsets.all(4),
                        strokeWidth: 2,
                        child: Container(
                          height: context.height * .3,
                          width: context.width,
                          padding: const EdgeInsets.all(4.0),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.fileVideo, size: 42),
                                SizedBox(height: 20),
                                Text(
                                  "Select video",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              child: _promotion.videoFile == null
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            _promotion.videoFile = null;
                          },
                          icon: const Icon(Icons.close),
                          label: const Text(
                            "Remove video",
                            style: TextStyle(),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            _promotion.videoFile = null;
                            await _pickPromotionVideo();
                          },
                          icon: const Icon(Icons.video_call_outlined),
                          label: const Text("Choose other"),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      );
    });
  }
}
