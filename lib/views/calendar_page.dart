import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../utils/constants.dart';
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
              icon: new Icon(Icons.person_2_outlined, size: 30.w),
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
          padding: EdgeInsets.all(2.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnOne = !pressBtnOne),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontSize: NORMAL_FONT_SIZE,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnOne ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnOne ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          ),
                          child: const Text('תורה'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnTwo = !pressBtnTwo),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnTwo ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnTwo ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          ),
                          child: const Text('נ"ך'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnThree = !pressBtnThree),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnThree ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnThree ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          ),
                          child: const Text('משניות'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnFour = !pressBtnFour),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnFour ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnFour ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          ),
                          child: const Text('ש"ס בבלי'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnFive = !pressBtnFive),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnFive ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnFive ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          ),
                          child: const Text('ש"ס ירושלמי'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnSix = !pressBtnSix),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnSix ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnSix ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          ),
                          child: const Text('הלכה שו"ע'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: ElevatedButton(
                          onPressed: () => setState(() => pressBtnSeven = !pressBtnSeven),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
                            side: const BorderSide(color: Colors.black26),
                            //Set the background color
                            primary: pressBtnSeven ? Colors.blue : Colors.white,
                            //Set the foreground (text + icon) color
                            onPrimary: pressBtnSeven ? Colors.white : Colors.blue,
                            //Set the padding on all sides to 30px
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          ),
                          child: const Text('רמב"םהיד החזקה'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
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