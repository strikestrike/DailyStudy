import 'package:dailystudy/views/textbook_page.dart';
import 'package:flutter/material.dart';
import '../components/my_bottom_nav_bar.dart';
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
    const OverviewScreen(),
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
    return Scaffold(
      body: _buildBody(context),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTap: (index) {
          _onItemTap(index);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_selectedIndex == -1) {
      return SingleChildScrollView(
          child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF3F60A3),
                          Color(0xFF1E3150),
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
                                      fontSize: 28,
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
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Text(
                            widget.textBottom ?? '',
                            textAlign: TextAlign.center,
                            style:TextStyle(fontSize: 28, color:Colors.white),
                          ),
                        ]
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _answers.map((Answer entry) => Column(
                            children: [
                              SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        answeredId = entry.id;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                      side: _buildBorder(entry),
                                      //Set the background color
                                      primary: Colors.white,
                                      //Set the foreground (text + icon) color
                                      onPrimary: Colors.black54,
                                      //Set the padding on all sides to 30px
                                      padding: const EdgeInsets.all(10),
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
                              SizedBox(height: 8.0)
                            ]
                        )
                        ).toList()
                    )
                )
              ]
          )
      );
    } else {
      return pages[_selectedIndex];
    }
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
          ? const Icon(Icons.check, color: Colors.green, size: 20)
          : const Icon(Icons.close, color: Colors.red, size: 20);
    }

    if (answer.correct && !answeredId.isEmpty) {
      return const Icon(Icons.check, color: Colors.green, size: 20);
    }

    return Container(
      width: 14,
      height: 14,
    );
  }

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 130);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 130);
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