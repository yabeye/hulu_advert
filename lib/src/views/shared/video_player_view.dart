import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:hulu_advert/src/extensions/file_extensions.dart';
import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.url,
    required this.dataSourceType,
  });

  final String url;
  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }
    _videoPlayerController.initialize().then(
          (_) => setState(
            () => _chewieController = ChewieController(
              autoPlay: true,
              looping: true,
              // showControls: false,
              playbackSpeeds: [],
              videoPlayerController: _videoPlayerController,
              aspectRatio: _videoPlayerController.value.aspectRatio,
            ),
          ),
        );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set more customizations here!
    final file = File(widget.url);

    return Container(
      color: AppColors.superLightGray,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  child: _videoPlayerController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Chewie(controller: _chewieController),
                        )
                      : const SizedBox.shrink(),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.black.withAlpha(72),
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
                        "${file.sizeInmB()} mB",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Theme.of(context).secondaryHeaderColor),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            5.height(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.url.split("/").last,
                  style: Theme.of(context).textTheme.titleMedium,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
