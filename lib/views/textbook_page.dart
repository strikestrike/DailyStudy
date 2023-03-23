import 'package:flutter/material.dart';
import '../components/list_item.dart';
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
                    //            const Text('Welcome to woolha.com', style: const TextStyle(color: Colors.teal)),
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
                                border: Border.all(width: 2, color: Colors.white)),
                            child: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                          )),
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
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/textbook_bg.png"),
                fit: BoxFit.cover
              ),
            ),
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                    children: <Widget>[
                      for(final textbook in data)
                        ListItem(textbook.title, textbook.chapterQuestions)
                    ]
                  ),
                ]
              )
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