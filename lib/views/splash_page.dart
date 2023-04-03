import 'package:flutter/material.dart';
import 'package:dailystudy/views/login_page.dart';
import 'package:dailystudy/views/home_page.dart';
import '../utils/constants.dart';
import '../utils/globals.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    (() async {
      await Future.delayed(Duration.zero);
      final isLoggedIn = Globals.firebaseUser != null;

      if (!mounted) return;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:(context) => isLoggedIn ? HomeScreen() : LoginScreen()));
    })();
    super.initState();
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
                  BG_GRADIENT_START_COLOR,
                  BG_GRADIENT_END_COLOR,
                ],
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children: [
                Text(
                  "תורת חיים",
                  style:TextStyle(
                    fontWeight:FontWeight.w600,
                    fontStyle:FontStyle.normal,
                    fontSize: TITLE_FONT_SIZE,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "לע״נ הרב שמריהו יוסף חיים קניבסקי",
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize: NORMAL_FONT_SIZE,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "לע״נ הרב חיים מאיר דרוקמן",
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize: NORMAL_FONT_SIZE,
                    color: Colors.white,
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