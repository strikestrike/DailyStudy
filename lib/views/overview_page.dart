import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';
import 'settings/setting_page.dart';


class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  List<int> _books = [
    1,2,3,4,5,6,7,8,9,10
  ];
  List<int> _items = [
    1,2,3,4,5,6,7,8,9,10
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0, // change height of ads as you like
            child: Container(
              height: 30.h,
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
              padding: EdgeInsets.only(left: 5.w, top: 5.h, right: 5.w),
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
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "תורת חיים",
                              style:TextStyle(
                                fontWeight:FontWeight.w600,
                                fontSize: TITLE2_FONT_SIZE,
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
                              padding: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.w),
                                border: Border.all(width: 0.3.w, color: Colors.white)
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
                    Text(
                      "לע״נ הרב שמריהו יוסף חיים קניבסקי",
                      style:TextStyle(fontSize: NORMAL_FONT_SIZE, color:Colors.white),
                    ),
                    Text(
                      "לע״נ הרב חיים מאיר דרוקמן",
                      style:TextStyle(fontSize: NORMAL_FONT_SIZE, color:Colors.white),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "תורת חיים",
                      style:TextStyle(
                        fontWeight:FontWeight.w600,
                        fontSize: SUB_TITLE_FONT_SIZE,
                        color:Colors.white,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 20.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Container(
              height: 20.h,
              child: ListView(
                  shrinkWrap: false,
                  padding: EdgeInsets.only(top: 1.h, left: 10.w, right: 5.w, bottom: 1.h),
                  children: _items
                      .map((e) => Row(
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
                        ))
                      .toList(),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 42.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text(
                      "לימוד יומי",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: SUB_TITLE_FONT_SIZE,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                          shrinkWrap: false,
                          padding: EdgeInsets.all(0),
                          children: _generateListView(),
                      ),
                    ),
                  ]
              )
          )
        ]
    );
  }

  List<Widget> _generateListView() {
    List<Widget> children = [];

    _books.asMap().forEach((index, option) => {
      children.add(
          Padding(
            padding: EdgeInsets.fromLTRB(1.h, 1.w, 1.h, 1.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 20.w, height: 4.h),
                  child: ElevatedButton(
                    onPressed: () async {
                      _pressConfirm(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ACTIVE_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'למדתי',
                      style: TextStyle(fontSize: NORMAL_FONT_SIZE),
                    ),
                  ),
                ),
                Text(
                  'א',
                  style:TextStyle(fontSize: NORMAL_FONT_SIZE, color:Colors.black87),
                ),
                Text(
                  'משניות',
                  style:TextStyle(fontSize: NORMAL_FONT_SIZE, color:Colors.black87),
                ),
              ],
            ),
          )
      ),
    });

    return children;
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