import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'views/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Daily Study',
            home: SplashScreen(),
          );
        },
        maxTabletWidth: 900,
    );
  }
}
