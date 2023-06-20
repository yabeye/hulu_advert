import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/extensions/file_extensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'package:hulu_advert/src/controllers/product_controller.dart';
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
  // final _productController = Get.find<ProductController>();
  File? _promotionVideo;

  _pickPromotionVideo() async {
    XFile? selectedVideo = await Common.pickVideo();

    if (selectedVideo == null) {
      return;
    }
    debugPrint("Selected now: ${selectedVideo!.path}");

    _promotionVideo = File(selectedVideo.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
            child: _promotionVideo != null
                ? ClipRRect(
                    borderRadius:
                        BorderRadius.circular(defaultBorderRadiusSize),
                    child: VideoPlayerView(
                      url: _promotionVideo!.path,
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
                          child: Icon(FontAwesomeIcons.fileVideo, size: 42),
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(
            child: _promotionVideo == null
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          _promotionVideo = null;
                          setState(() {});
                        },
                        icon: const Icon(Icons.close),
                        label: const Text(
                          "Remove video",
                          style: TextStyle(),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          _promotionVideo = null;
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
  }
}
