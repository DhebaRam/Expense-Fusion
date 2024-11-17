import 'dart:async';

import 'package:expensefusion/common/base_components/base_assets.dart';
import 'package:expensefusion/common/base_components/base_colors.dart';
import 'package:expensefusion/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'common/utils/navigation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      Future.delayed(
        const Duration(),
            () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
      );

    });
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    Timer(const Duration(seconds: 2), (() async {
      replaceRoute(context, const HomeScreen());
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.bgColor,
      body: Center(
        child: SvgPicture.asset(BaseAssets.splashImage)
      ),
    );
  }
}
