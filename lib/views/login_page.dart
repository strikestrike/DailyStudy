import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';
import 'verify_page.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? phoneNumber;
    final _formKey = GlobalKey<FormState>();

    var textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 0.2.w, color: ACTIVE_COLOR),
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
              Form(
                key: _formKey,
                child: IntlPhoneField(
                  autofocus: true,
                  invalidNumberMessage: 'Invalid Phone Number!',
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (phone) => phoneNumber = phone.completeNumber,
                  initialCountryCode: 'IL',
                  flagsButtonPadding: const EdgeInsets.only(left: 15),
                  showDropdownIcon: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                    enabledBorder: textFieldBorder,
                    border: textFieldBorder,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              ElevatedButton(
                onPressed: () {
                  if (isNullOrBlank(phoneNumber) ||
                      !_formKey.currentState!.validate()) {
                    showSnackBar('Please enter a valid phone number!');
                  } else {
                    Navigator.pushNamed(
                      context,
                      VerifyScreen.id,
                      arguments: phoneNumber,
                    );
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
        )
      ),
    );
  }
}