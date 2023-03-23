import 'package:flutter/material.dart';
import 'verify_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textfieldBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Color(0xff009ACB)), //<-- SEE HERE
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );

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
                child:Column(
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
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0), //apply padding to all four sides
                      child: Text(
                        'מס פלאפון ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      enabledBorder: textfieldBorder,
                      border: textfieldBorder,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyScreen()));
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