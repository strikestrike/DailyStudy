import 'dart:developer';

import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';
import '../widgets/custom_loader.dart';
import '../widgets/pin_input_field.dart';
import 'home_page.dart';

class VerifyScreen extends StatefulWidget {
  static const id = 'VerifyScreen';

  final String phoneNumber;

  const VerifyScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool _isButtonDisabled = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    log(widget.phoneNumber);
      return FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        signOutOnSuccessfulVerification: false,
        // sendOtpOnInitialize: true,
        linkWithExistingUser: false,
        autoRetrievalTimeOutDuration: const Duration(seconds: 60),
        otpExpirationDuration: const Duration(seconds: 60),
        onCodeSent: () {
          log(VerifyScreen.id, msg: 'OTP sent!');
        },
        onLoginSuccess: (userCredential, autoVerified) async {
          log(
            VerifyScreen.id,
            msg: autoVerified
                ? 'OTP was fetched automatically!'
                : 'OTP was verified manually!',
          );

          showSnackBar('Phone number verified successfully!');

          log(
            VerifyScreen.id,
            msg: 'Login Success UID: ${userCredential.user?.uid}',
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.id,
                (route) => false,
          );
        },
        onLoginFailed: (authException, stackTrace) {
          log(
            VerifyScreen.id,
            msg: authException.message,
            error: authException,
            stackTrace: stackTrace,
          );

          /*switch (authException.code) {
            case 'invalid-phone-number':
              return showSnackBar('Invalid phone number!');
            case 'invalid-verification-code':
              return showSnackBar('The entered OTP is invalid!');
            default:
              showSnackBar('Something went wrong!');
          }*/
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.id,
                (route) => false,
          );
        },
        onError: (error, stackTrace) {
          log(
            VerifyScreen.id,
            error: error,
            stackTrace: stackTrace,
          );

          showSnackBar('An error occurred!');
        },
        builder: (context, controller) {
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
                    if (controller.isSendingCode)
                        Column(
                          children: [
                            CustomLoader(),
                            SizedBox(height: 50),
                            Text(
                              'Listening for OTP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: NORMAL_FONT_SIZE,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                    if (!controller.isSendingCode)
                        PinInputField(
                          length: 6,
                          onSubmit: (enteredOtp) async {
                            setState(() {
                              _isButtonDisabled = false;
                              _code = enteredOtp;
                            });
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
                          onPressed: _isButtonDisabled  ? null : () async {
                            final verified = await controller.verifyOtp(_code!);
                            if (verified) {
                                // number verify success
                                // will call onLoginSuccess handler
                            } else {
                            // phone verification failed
                            // will call onLoginFailed or onError callbacks with the error
                            }
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
        },
      );
  }
}