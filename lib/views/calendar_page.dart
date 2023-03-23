import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'settings/setting_page.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool pressBtnOne = true;
  bool pressBtnTwo = false;
  bool pressBtnThree = false;
  bool pressBtnFour = false;
  bool pressBtnFive = false;
  bool pressBtnSix = false;
  bool pressBtnSeven = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        actions: [
          new SizedBox(
            height: 80.0,
            width: 80.0,
            child: new IconButton(
              alignment: Alignment.center,
              color: Colors.black,
              icon: new Icon(Icons.account_circle_outlined, size: 40.0),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingScreen()));
              }
            ),
          )
        ],
        backgroundColor: Colors.white,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnOne = !pressBtnOne),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnOne ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnOne ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                          ),
                          child: const Text('תורה'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnTwo = !pressBtnTwo),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnTwo ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnTwo ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                          ),
                          child: const Text('נ"ך'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnThree = !pressBtnThree),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnThree ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnThree ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                          ),
                          child: const Text('משניות'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnFour = !pressBtnFour),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnFour ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnFour ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                          ),
                          child: const Text('ש"ס בבלי'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnFive = !pressBtnFive),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnFive ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnFive ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                          ),
                          child: const Text('ש"ס ירושלמי'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnSix = !pressBtnSix),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnSix ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnSix ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                          ),
                          child: const Text('הלכה שו"ע'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnSeven = !pressBtnSeven),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnSeven ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnSeven ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: const EdgeInsets.only(left: 10.0, right: 10),
                          ),
                          child: const Text('רמב"םהיד החזקה'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SfCalendar(
                  view: CalendarView.month,
                )
              ],
            )
          )
        )
      )
    );
  }
}