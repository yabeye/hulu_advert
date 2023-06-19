import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/themes.dart';
import 'package:hulu_advert/src/utils/constants.dart';

class StackLoader extends StatelessWidget {
  const StackLoader({super.key, required this.child, this.isLoading});
  final Widget child;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: !(isLoading ?? false)
              ? Container()
              : Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.superLightGray,
                      // border: Border.all(
                      //   color: AppColors.kSecondaryColor,
                      //   width: 2,
                      // ),
                      borderRadius:
                          BorderRadius.circular(defaultBorderRadiusSize),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(22.0),
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
