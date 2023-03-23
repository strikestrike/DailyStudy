import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
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
        padding: EdgeInsets.all(30),
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
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "תורת חיים",
                    style:TextStyle(
                      fontWeight:FontWeight.w600,
                      fontSize:46,
                      color:Colors.white,
                    ),
                  ),
                  Text(
                    "לע״נ הרב שמריהו יוסף חיים קניבסקי",
                    style:TextStyle(fontSize:14, color:Colors.white),
                  ),
                  Text(
                    "לע״נ הרב חיים מאיר דרוקמן",
                    style:TextStyle(fontSize:14, color:Colors.white),
                  ),
                ]
              )
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'סמס',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'יש להכניס את הקוד ששלחנו לך  ',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  VerificationCode(
                    textStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
                    keyboardType: TextInputType.number,
                    underlineColor: const Color(0xff009ACB), // If this is null it will use primaryColor: Colors.red from Theme
                    length: 6,
                    cursorColor: const Color(0xff009ACB), // If this is null it will default to the ambient
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
                  const SizedBox(height: 30),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: const TextStyle(fontSize: 14.0, color: Colors.blue),
                          text: "קוד",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            }
                        ),
                        const TextSpan(
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                          text: "לא קיבלתי "
                        ),
                      ]
                    )
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff009ACB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      child: Text(
                        'כניסה',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ]
              )
            ),
          ]
        ),
      ),
    );
  }
}