import 'dart:async';

import 'package:dailystudy/views/login_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const LoginScreen()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF3F60A3),
                  Color(0xFF1E3150),
                ],
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children: const [
                Text(
                  "תורת חיים",
                  style:TextStyle(
                    fontWeight:FontWeight.w600,
                    fontStyle:FontStyle.normal,
                    fontSize:46,
                    color:Color(0xffffffff),
                  ),
                ),
                Text(
                  "לע״נ הרב שמריהו יוסף חיים קניבסקי",
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xffffffff),
                  ),
                ),
                Text(
                  "לע״נ הרב חיים מאיר דרוקמן",
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}