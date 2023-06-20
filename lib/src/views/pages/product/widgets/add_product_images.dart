import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hulu_advert/src/extensions/num_extensions.dart';
import 'package:hulu_advert/src/utils/utils.dart';
import 'package:hulu_advert/src/views/pages/product/widgets/widgets.dart';

class AddProductImagesSection extends StatefulWidget {
  const AddProductImagesSection({
    super.key,
  });

  @override
  State<AddProductImagesSection> createState() =>
      _AddProductImagesSectionState();
}

class _AddProductImagesSectionState extends State<AddProductImagesSection> {
  List<File> _photos = [];
  int maxPhotoQty = productImagesMax + 1;

  void _pickPhotos() async {
    final files = await Common.pickImages();

    if (files.length > (productImagesMax - _photos.length + 1)) {
      Common.showNotification(
        title: "ERROR",
        body: "You can only upload only $productImagesMax photos!",
      );
      return;
    }

    _photos.insertAll(0, [...files]);
    List<File> uniqueFiles = [];
    for (var photo in _photos) {
      if (!uniqueFiles.map((e) => e.path).toList().contains(photo.path)) {
        uniqueFiles.add(photo);
      }
    }
    _photos = uniqueFiles;

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
            "Photos",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          5.height(),
          Text(
            "You can add up to $productImagesMax images",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          20.height(),
          SizedBox(
            width: context.width,
            height: context.height * .4,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _photos.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                    child: index < _photos.length
                        ? PickedImageCard(
                            file: _photos[index],
                            onDelete: () {
                              _photos.removeAt(index);
                              setState(() {});
                            },
                          )
                        : _photos.length >= productImagesMax
                            ? Container()
                            : InkWell(
                                onTap: _pickPhotos,
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(
                                      defaultBorderRadiusSize),
                                  dashPattern: const [4, 4],
                                  color: Colors.grey,
                                  borderPadding: const EdgeInsets.all(4),
                                  strokeWidth: 2,
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Center(
                                      child: Icon(Icons.add_a_photo),
                                    ),
                                  ),
                                ),
                              ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
