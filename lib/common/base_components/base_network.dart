import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'base_colors.dart';
import 'full_file_url.dart';

// import 'full_file_url.dart';
//
String baseUrl = ''; //APIS.baseUrl;

class BaseImageNetwork extends StatelessWidget {
  final String? link;
  final bool? concatBaseUrl, isNetworkImage, isAssetImage, boxDecoration;
  final double? borderRadius;
  final BoxFit? fit;
  final BoxShape boxShape;
  final Color borderColor;
  final Widget? errorWidget;
  final double? topMargin, bottomMargin, rightMargin, leftMargin, height, width;

  const BaseImageNetwork({
    super.key,
    this.link,
    this.topMargin,
    this.bottomMargin,
    this.rightMargin,
    this.leftMargin,
    this.height,
    this.width,
    this.concatBaseUrl,
    this.isNetworkImage = true,
    this.isAssetImage = false,
    this.boxDecoration = false,
    this.borderRadius,
    this.fit,
    this.boxShape = BoxShape.circle,
    this.borderColor = BaseColors.primaryColor,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    // log('Image Url----- > ${generateFullFileUrl(link)}  ... $link');
    if (!isNetworkImage!) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: boxShape,
            color: borderColor,
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  BaseColors.transparentColor,
                  BaseColors.transparentColor
                ])),
        padding: EdgeInsets.only(
            top: topMargin ?? 0,
            right: rightMargin ?? 0,
            bottom: bottomMargin ?? 0,
            left: leftMargin ?? 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          child: Image.file(
            File(link ?? ''),
            width: width,
            height: height,
            fit: fit ?? BoxFit.fitHeight,
            errorBuilder: (context, url, error) {
              if (errorWidget == null) {
                return Icon(Icons.image,
                    size: width, color: BaseColors.secondaryColor);
              } else {
                return errorWidget ?? const SizedBox();
              }
            },
            // loadingBuilder: (BuildContext context, Widget child,
            //     ImageChunkEvent? loadingProgress) {
            //   if (loadingProgress == null) return child;
            //   return Center(
            //     child: CircularProgressIndicator(
            //       value: loadingProgress.expectedTotalBytes != null
            //           ? loadingProgress.cumulativeBytesLoaded /
            //           loadingProgress.expectedTotalBytes!
            //           : null,
            //     ),
            //   );
            // },
          ),
        ),
      );
    }
    if (isAssetImage!) {
      return Container(
        width: width,
        height: height,
        decoration: boxDecoration!
            ? BoxDecoration(
                shape: boxShape,
                color: borderColor,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      BaseColors.transparentColor,
                      BaseColors.transparentColor
                    ]))
            : const BoxDecoration(),
        padding: EdgeInsets.only(
            top: topMargin ?? 0,
            right: rightMargin ?? 0,
            bottom: bottomMargin ?? 0,
            left: leftMargin ?? 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          child: Image.asset(
            link!,
            width: width,
            height: height,
            fit: fit ?? BoxFit.fitHeight,
            errorBuilder: (context, url, error) {
              if (errorWidget == null) {
                return Icon(Icons.image, size: width);
              } else {
                return errorWidget ?? const SizedBox();
              }
            },
            // loadingBuilder: (BuildContext context, Widget child,
            //     ImageChunkEvent? loadingProgress) {
            //   if (loadingProgress == null) return child;
            //   return Center(
            //     child: CircularProgressIndicator(
            //       value: loadingProgress.expectedTotalBytes != null
            //           ? loadingProgress.cumulativeBytesLoaded /
            //           loadingProgress.expectedTotalBytes!
            //           : null,
            //     ),
            //   );
            // },
          ),
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: boxDecoration!
          ? BoxDecoration(
              shape: boxShape,
              color: borderColor,
              gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [BaseColors.primaryColor, BaseColors.secondaryColor]))
          : const BoxDecoration(),
      padding: EdgeInsets.only(
          top: topMargin ?? 0,
          right: rightMargin ?? 0,
          bottom: bottomMargin ?? 0,
          left: leftMargin ?? 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: CachedNetworkImage(
          imageUrl:
              ((link ?? "").contains("http") || (link ?? "").contains("https"))
                  ? (link ?? "")
                  : generateFullFileUrl(link),
          // baseUrl + (link ?? ""),
          width: width,
          height: height,
          fit: fit ?? BoxFit.fitHeight,
          errorWidget: (context, url, error) {
            if (errorWidget == null) {
              return Icon(Icons.image,
                  size: width, color: BaseColors.whiteColor);
            } else {
              return errorWidget ?? const SizedBox();
            }
          },
          progressIndicatorBuilder:
              (BuildContext context, url, downloadProgress) {
            return SizedBox(
              width: width,
              height: height,
              child: Center(
                  child: SizedBox(
                width: width,
                height: height,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              )
                  // CircularProgressIndicator(
                  //   color: CustomColors.whiteColor,
                  //   value: downloadProgress.progress,
                  // ),
                  ),
            );
          },
        ),
      ),
    );
  }
}
