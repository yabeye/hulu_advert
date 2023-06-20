import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';
import 'package:hulu_advert/src/utils/constants.dart';

class PickedImageCard extends StatelessWidget {
  const PickedImageCard({
    super.key,
    required this.file,
    required this.onDelete,
  });
  final File file;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              defaultBorderRadiusSize,
            ),
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: -5,
            right: -5,
            child: InkWell(
              onTap: onDelete,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(
                    defaultBorderRadiusSize,
                  ),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
