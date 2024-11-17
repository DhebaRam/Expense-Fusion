import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/utils_function.dart';
import 'base_assets.dart';

class BackButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final double? horizontalMargin;

  const BackButtonWidget({super.key, this.onTap, this.horizontalMargin});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 5),
        child: GestureDetector(
            onTap: onTap ??
                () {
                  triggerHapticFeedback();
                  Navigator.pop(context);
                },
            child: Container(
                height: 55,
                width: 55,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(left: 10),
                margin:
                    EdgeInsets.symmetric(horizontal: horizontalMargin ?? 15),
                decoration: BoxDecoration(
                    // border:
                    // Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(15)),
                // child: const Icon(Icons.arrow_back_ios)
                child: SvgPicture.asset(BaseAssets.backIcon))));
  }
}
