import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/routes/app_routes.dart';
import 'package:hulu_advert/src/themes/app_colors.dart';

class AppFloatingButton extends StatelessWidget {
  final ValueNotifier<bool> isDialOpen;
  final VoidCallback onChooseUpload;
  final bool visible;

  const AppFloatingButton({
    super.key,
    required this.isDialOpen,
    required this.onChooseUpload,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeChild: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      spaceBetweenChildren: 4,
      iconTheme: const IconThemeData(size: 32, color: Colors.white),
      labelTransitionBuilder: (widget, animation) =>
          ScaleTransition(scale: animation, child: widget),
      // childrenButtonSize: const Size(40.0, 70.0),
      visible: visible,
      overlayColor: AppColors.kSecondaryColor,
      overlayOpacity: 0.7,
      onOpen: () => debugPrint('Open'),
      onClose: () => debugPrint('Close'),
      useRotationAnimation: true,
      elevation: 8.0,
      animationCurve: Curves.bounceInOut,
      isOpenOnStart: false,
      shape: const StadiumBorder(),
      children: [
        SpeedDialChild(
          child: const FaIcon(FontAwesomeIcons.images),
          backgroundColor: Colors.white,
          foregroundColor: AppColors.kPrimaryColor,
          label: 'Add Product',
          labelStyle: const TextStyle(color: AppColors.black),
          visible: true,
          onTap: () {
            Get.toNamed(AppRoutes.product);
          },
        ),
        SpeedDialChild(
          child: const FaIcon(FontAwesomeIcons.video),
          backgroundColor: Colors.white,
          foregroundColor: AppColors.kPrimaryColor,
          label: 'Add Promotion',
          labelStyle: const TextStyle(color: AppColors.black),
          visible: true,
          onTap: onChooseUpload,
        ),
      ],
      child: const Icon(Icons.add, color: AppColors.white),
    );
  }
}
