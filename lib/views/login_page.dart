import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';
import 'verify_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 0.2.w, color: ACTIVE_COLOR), //<-- SEE HERE
      borderRadius: BorderRadius.all(Radius.circular(50.w)),
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(5.w, 8.h, 5.w, 8.h),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "תורת חיים",
                style:TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize: TITLE_FONT_SIZE,
                  color:Colors.white,
                ),
              ),
              Text(
                "לע״נ הרב שמריהו יוסף חיים קניבסקי",
                style:TextStyle(fontSize: NORMAL_FONT_SIZE, color:Colors.white),
              ),
              Text(
                "לע״נ הרב חיים מאיר דרוקמן",
                style:TextStyle(fontSize: NORMAL_FONT_SIZE, color:Colors.white),
              ),
              SizedBox(height: 15.h),
              Text(
                'כניסה',
                style: TextStyle(color: Colors.white, fontSize: SUB_TITLE_FONT_SIZE),
              ),
              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5.w, 0), //apply padding to all four sides
                  child: Text(
                    'מס פלאפון ',
                    style: TextStyle(color: Colors.white, fontSize: NORMAL_FONT_SIZE),
                  ),
                ),
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                  enabledBorder: textFieldBorder,
                  border: textFieldBorder,
                ),
              ),
              SizedBox(height: 5.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: ACTIVE_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  elevation: 0,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(14.w, 1.5.h, 14.w, 1.5.h),
                  child: Text(
                    'כניסה',
                    style: TextStyle(fontSize: NORMAL_FONT_SIZE),
                  ),
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}