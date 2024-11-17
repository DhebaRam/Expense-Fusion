import 'package:flutter/material.dart';

import 'base_colors.dart';

class BaseCardContainer extends StatelessWidget {
  final Widget child;
  final Color color, borderColor;
  final double? marginVertical,
      marginHorizontal,
      paddingVertical,
      paddingHorizontal, borderRadius;

  const BaseCardContainer(
      {super.key,
      this.child = const SizedBox.shrink(),
      this.marginVertical,
      this.paddingVertical,
      this.marginHorizontal,
      this.paddingHorizontal,
      this.borderRadius,
      this.color = BaseColors.containerBGColor,
      this.borderColor = BaseColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVertical ?? 0, horizontal: marginHorizontal ?? 0),
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical ?? 0, horizontal: paddingHorizontal ?? 0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          // boxShadow: [
          //   BoxShadow(
          //     color: borderColor,
          //     spreadRadius: 0,
          //     blurRadius: 0,
          //     offset: const Offset(0, 0), // changes position of shadow
          //   ),
          // ],
        ),
        child: child);
  }
}
