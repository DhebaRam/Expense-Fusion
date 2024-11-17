import 'package:expensefusion/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      if (FocusManager.instance.primaryFocus!.hasFocus) {
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }, child: ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Reactive Flutter',
          theme: ThemeData(
              primarySwatch: Colors.indigo, canvasColor: Colors.transparent),
          //Our only screen/page we have
          home: const SplashScreen(),
        );
      },
    ));
  }
}
