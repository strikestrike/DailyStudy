import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../components/list_item.dart';
import '../utils/constants.dart';
import 'settings/setting_page.dart';

class TextbookScreen extends StatefulWidget {
  const TextbookScreen({Key? key}) : super(key: key);

  @override
  _TextbookScreenState createState() => _TextbookScreenState();
}

class _TextbookScreenState extends State<TextbookScreen> {

  final List<Textbook> data = <Textbook>[
    Textbook(
        'ש"ס בבלי',
        <Map<String, String>>[
          { 'chapter': "סדר זרעים", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
          { 'chapter': "סדר מועד", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
          { 'chapter': "סדר נזיקין", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
        ]
    ),
    Textbook(
        'ש"ס ירושלמי',
        <Map<String, String>>[
          { 'chapter': "סדר זרעים", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
          { 'chapter': "סדר מועד", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
          { 'chapter': "סדר נזיקין", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
        ]
    ),
    Textbook(
        'הלכה שו"ע',
        <Map<String, String>>[
          { 'chapter': "סדר זרעים", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
          { 'chapter': "סדר מועד", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
          { 'chapter': "סדר נזיקין", 'question': 'מה הייתה המכה השלישית ב"עשר מכות מצריים'},
        ]
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
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
                            fontSize: TITLE2_FONT_SIZE ,
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
                                border: Border.all(width: 0.3.w, color: Colors.white)),
                            child: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                          )),
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
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/textbook_bg.png"),
                fit: BoxFit.cover
              ),
            ),
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Scrollable(
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 1.h, left: 1.w, right: 1.h, bottom: 1.w),
                    children: <Widget>[
                      for(final textbook in data)
                        ListItem(textbook.title, textbook.chapterQuestions)
                    ]
                );
              },
            )
          )
        ),
      ]
    );
  }
}

class Textbook {
  String title;
  List<Map<String, String>> chapterQuestions;

  Textbook(this.title, this.chapterQuestions);
}