import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';
import 'home_page.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 2.h),
                Text(
                  'סמס',
                  style: TextStyle(color: Colors.white, fontSize: SUB_TITLE_FONT_SIZE),
                ),
                SizedBox(height: 2.h),
                Text(
                  'יש להכניס את הקוד ששלחנו לך  ',
                  style: TextStyle(color: Colors.white, fontSize: NORMAL_FONT_SIZE),
                ),
                SizedBox(height: 2.h),
                VerificationCode(
                  textStyle: TextStyle(fontSize: NORMAL_FONT_SIZE, color: Colors.white),
                  keyboardType: TextInputType.number,
                  underlineColor: ACTIVE_COLOR, // If this is null it will use primaryColor: Colors.red from Theme
                  length: 6,
                  cursorColor: ACTIVE_COLOR, // If this is null it will default to the ambient
                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
                ),
                SizedBox(height: 5.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          style: TextStyle(fontSize: NORMAL_FONT_SIZE, color: Colors.white),
                          text: "לא קיבלתי "
                      ),
                      TextSpan(
                          style: TextStyle(fontSize: NORMAL_FONT_SIZE, color: Colors.blue),
                          text: "קוד",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            }
                      ),
                    ]
                  )
                ),
                SizedBox(height: 5.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
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
          ),
      ),
    );
  }
}