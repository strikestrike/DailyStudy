import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'settings/setting_page.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0, // change height of ads as you like
            child: Container(
              height: 210,
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
              padding: EdgeInsets.only(left: 20, top: 30, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        GestureDetector(
                          child: const Icon( Icons.arrow_back_ios, color: Colors.white),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "תורת חיים",
                              style:TextStyle(
                                fontWeight:FontWeight.w600,
                                fontSize:46,
                                color:Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingScreen()));
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 2, color: Colors.white)
                              ),
                              child: const Icon(
                                Icons.person_2_outlined,
                                color: Colors.white,
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "לע״נ הרב שמריהו יוסף חיים קניבסקי",
                      style:TextStyle(fontSize:14, color:Colors.white),
                    ),
                    const Text(
                      "לע״נ הרב חיים מאיר דרוקמן",
                      style:TextStyle(fontSize:14, color:Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "תורת חיים",
                      style:TextStyle(
                        fontWeight:FontWeight.w600,
                        fontSize:36,
                        color:Colors.white,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 170,
              child: ListView(
                  shrinkWrap: false,
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 18.0, bottom: 5.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "0",
                            style: TextStyle(color: Colors.black87),
                          ),
                          Text(
                            "רמבם היד החז",
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "0",
                            style: TextStyle(color: Colors.black87),
                          ),
                          Text(
                            "רמבם היד החז",
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "0",
                            style: TextStyle(color: Colors.black87),
                          ),
                          Text(
                            "רמבם היד החז",
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 340),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Text(
                      "לימוד יומי",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                          shrinkWrap: false,
                          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      _pressConfirm(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff009ACB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        'למדתי',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'א',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                  const Text(
                                    'משניות',
                                    style:TextStyle(fontSize:14, color:Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ]
              )
          )
        ]
    );
  }

  _pressConfirm(BuildContext context) async {
    if (await confirm(
      context,
      title: const Text('היי האם קראת את'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('נ"ך פרק ג ד ה'),
          const Text('אתמול')
        ],
      ),
      textOK: const Text('Yes'),
      textCancel: const Text('No'),
    )) {
      print('pressedOK');
    }
    print('pressedCancel');
  }
}