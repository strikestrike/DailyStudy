import 'package:dailystudy/views/textbook_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../components/my_bottom_nav_bar.dart';
import '../utils/constants.dart';
import 'calendar_page.dart';
import 'overview_page.dart';
import 'settings/setting_page.dart';

class QuestionScreen extends StatefulWidget {
  final String? textTop;
  final String? textBottom;
  const QuestionScreen(
      {Key? key, String? this.textTop, String? this.textBottom})
      : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _selectedIndex = -1;
  final pages = [
    CalendarScreen(),
    OverviewScreen(),
    TextbookScreen(),
  ];

  final List<Answer> _answers = <Answer>[
    Answer(
      '1',
      'מכת דם',
      false
    ),
    Answer(
      '2',
      'מכת שחין',
      false
    ),
    Answer(
      '3',
      'מכת כינים',
      false
    ),
    Answer(
      '4',
      'מכת חושך',
      true
    ),
  ];

  String answeredId = '';

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (_selectedIndex == -1) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(55.h),
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: EdgeInsets.only(left: 5.w, top: 5.h, right: 5.w),
                    height: 50.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          BG_GRADIENT_START_COLOR,
                          BG_GRADIENT_END_COLOR,
                        ],
                      ),
                    ),
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
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.textTop ?? '',
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
                                          borderRadius: BorderRadius.circular(50.w),
                                          border: Border.all(width: 0.3.w, color: Colors.white)),
                                      child: const Icon(
                                        Icons.person_2_outlined,
                                        color: Colors.white,
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            widget.textBottom ?? '',
                            textAlign: TextAlign.center,
                            style:TextStyle(fontSize: NORMAL_FONT_SIZE, color:Colors.white),
                          ),
                        ]
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: _buildBody(context),
              ),
              bottomNavigationBar: MyBottomNavBar(
                selectedIndex: _selectedIndex,
                onItemTap: (index) {
                  _onItemTap(index);
                },
              ),
            );
          }

          return Scaffold(
            body: pages[_selectedIndex],
            bottomNavigationBar: MyBottomNavBar(
              selectedIndex: _selectedIndex,
              onItemTap: (index) {
                _onItemTap(index);
              },
            ),
          );
        }
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 2.h),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _answers.map((Answer entry) => Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 8.h,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      answeredId = entry.id;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: NORMAL_FONT_SIZE,
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                                    side: _buildBorder(entry),
                                    //Set the background color
                                    primary: Colors.white,
                                    //Set the foreground (text + icon) color
                                    onPrimary: Colors.black54,
                                    //Set the padding on all sides to 30px
                                    padding: EdgeInsets.all(3.w),
                                  ),
                                  icon: _buildIcon(entry),
                                  label: Row(
                                    mainAxisAlignment: MainAxisAlignment.end, // add this line to float the text to right.
                                    children: [
                                      Text(entry.answer),
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 2.h)
                          ]
                      )
                      ).toList()
                  )
              )
            ]
        )
    );
  }

  BorderSide _buildBorder(Answer answer) {
    if (answeredId == answer.id) {
      return answer.correct
          ? const BorderSide(color: Colors.green)
          : const BorderSide(color: Colors.red);
    }

    if (answer.correct && !answeredId.isEmpty) {
      return const BorderSide(color: Colors.green);
    }

    return const BorderSide(color: Colors.black26);
  }

  Widget _buildIcon(Answer answer) {
    if (answeredId == answer.id) {
      return answer.correct
          ? Icon(Icons.check, color: Colors.green, size: 5.w)
          : Icon(Icons.close, color: Colors.red, size: 5.w);
    }

    if (answer.correct && !answeredId.isEmpty) {
      return Icon(Icons.check, color: Colors.green, size: 5.w);
    }

    return Container(
      width: 5.w,
      height: 5.w,
    );
  }

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 30.h);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, 30.h);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Answer {
  String id;
  String answer;
  bool correct;

  Answer(this.id, this.answer, this.correct);
}