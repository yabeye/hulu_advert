import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';

import 'package:hulu_advert/src/controllers/promotion_controller.dart';
import 'package:hulu_advert/src/extensions/extensions.dart';
import 'package:hulu_advert/src/themes/themes.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:hulu_advert/src/views/shared/video_player_view.dart';

class AddPromotionVideoSection extends StatefulWidget {
  const AddPromotionVideoSection({super.key});

  @override
  State<AddPromotionVideoSection> createState() =>
      _AddPromotionVideoSectionState();
}

class _AddPromotionVideoSectionState extends State<AddPromotionVideoSection> {
  final _promotion = Get.find<PromotionController>();
  double? originalFileSize;
  bool _isCompressing = false;

  _pickPromotionVideo() async {
    File? selectedVideo = await Common.pickVideo();

    if (selectedVideo == null) {
      return;
    }

    originalFileSize = selectedVideo.sizeInmB();

    _isCompressing = true;
    setState(() {});
    selectedVideo = await Common.compressVideo(selectedVideo);

    // Check max video size
    if (selectedVideo.sizeInmB() > promotionVideoMaxSizeInmB) {
      _isCompressing = false;
      setState(() {});
      Common.showError(
        "Upload videos only less than $promotionVideoMaxSizeInmB mB",
      );
      return;
    }

    _promotion.videoFile = File(selectedVideo.path);
    _isCompressing = false;
    setState(() {});
  }

  @override
  void dispose() {
    _promotion.reset();
    super.dispose();
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
              "You can only upload up to $promotionVideoMaxSizeInmB mB",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            20.height(),
            SizedBox(
              child: _isCompressing
                  ? Container(
                      height: context.height * .3,
                      width: context.width,
                      padding: const EdgeInsets.all(4.0),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            SizedBox(height: 8),
                            LinearProgressIndicator(),
                            SizedBox(height: 8),
                            Text(
                              "Uploading ...",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Spacer(),
                            // TextButton.icon(
                            //   onPressed: () {
                            //     VideoCompress.cancelCompression();
                            //     VideoCompress.deleteAllCache();
                            //   },
                            //   icon: const Icon(Icons.close_outlined),
                            //   label: const Text("Cancel"),
                            // )
                          ],
                        ),
                      ),
                    )
                  : _promotion.videoFile != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Original size: $originalFileSize mB",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            5.height(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  defaultBorderRadiusSize),
                              child: VideoPlayerView(
                                url: _promotion.videoFile!.path,
                                dataSourceType: DataSourceType.file,
                              ),
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: _pickPromotionVideo,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius:
                                const Radius.circular(defaultBorderRadiusSize),
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
              child: _promotion.videoFile == null || _isCompressing
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            _promotion.videoFile = null;
                            originalFileSize = null;
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
                            originalFileSize = null;
                            setState(() {});
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
