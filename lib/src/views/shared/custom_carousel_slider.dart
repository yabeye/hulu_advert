import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/views/shared/shared.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final int currentIndex;
  final String imageTitle;
  final String imageDesc;
  final void Function(int)? onPageChanged;

  const CustomCarouselSlider({
    super.key,
    required this.imageUrls,
    required this.height,
    required this.currentIndex,
    this.imageTitle = "",
    this.imageDesc = "",
    this.onPageChanged,
  });

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imageUrls.length,
            onPageChanged: widget.onPageChanged,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    ImageDetail(
                      file: File(
                        widget.imageUrls[index],
                      ),
                      title: widget.imageTitle,
                      description: widget.imageDesc,
                    ),
                  );
                },
                child: Image.file(
                  File(
                    widget.imageUrls[index],
                  ),
                  fit: BoxFit.cover,
                ),
              );
            },
            // pageSnapping: true,
            scrollDirection: Axis.horizontal,
            // physics: const ClampingScrollPhysics(),
            allowImplicitScrolling: false,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: widget.imageUrls.length == 1
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.imageUrls.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: widget.currentIndex == index
                              ? AppColors.kPrimaryColor
                              : AppColors.gray,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
