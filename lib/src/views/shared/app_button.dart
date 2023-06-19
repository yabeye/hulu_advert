import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulu_advert/src/themes/app_theme.dart';
import 'package:hulu_advert/src/themes/themes.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.color = AppColors.kPrimaryColor,
    this.textColor = Colors.white,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    this.margin = const EdgeInsets.only(
      left: 16,
      right: 16,
    ),
    this.space = 12,
    this.height = 56,
    this.width = double.infinity,
    this.textFontSize = 16,
    this.borderRadius,
    this.isLoading = false,
  }) : super(key: key) {
    isOutline = false;
  }

  AppButton.outline({
    Key? key,
    required this.onPressed,
    this.text,
    this.color = AppColors.kPrimaryColor,
    this.textColor = Colors.white,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.space = 12,
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius,
    this.isLoading = false,
    this.textFontSize = 16,
  }) : super(key: key) {
    isOutline = true;
  }

  late final bool isOutline;
  final String? text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;

  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double space;
  final double? height;
  final double? width;
  final bool isLoading;
  final double textFontSize;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(48),
        child: BaseButton(
          onPressed: isLoading ? () {} : onPressed,
          color: isOutline ? AppColors.transparent : color,
          child: Container(
            height: height,
            width: width,
            padding: padding,
            decoration: BoxDecoration(
              border: Border.all(
                color: onPressed != null ? color : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: isLoading
                ? const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (prefixIcon != null)
                        Padding(
                          padding:
                              EdgeInsets.only(right: text == null ? 0 : space),
                          child: prefixIcon!,
                        ),
                      if (text != null)
                        Text(
                          text ?? "",
                          style: isOutline
                              ? TextStyle(
                                  color: color,
                                  fontSize: textFontSize,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: AppThemes.font,
                                )
                              : TextStyle(
                                  fontSize: textFontSize,
                                  color: textColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: AppThemes.font,
                                ),
                        ),
                      if (suffixIcon != null)
                        Padding(
                          padding:
                              EdgeInsets.only(right: text == null ? 0 : space),
                          child: suffixIcon!,
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color disabledColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      color: color,
      borderRadius: BorderRadius.zero,
      disabledColor: disabledColor,
    );
  }
}
