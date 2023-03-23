import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../../components/multi_select.dart';
import '../../components/my_bottom_nav_bar.dart';
import '../../components/single_choice_drop_down_button.dart';
import 'package:dailystudy/views/settings/setting_page.dart';

import '../calendar_page.dart';
import '../overview_page.dart';
import '../textbook_page.dart';

class SettingsForm5 extends StatefulWidget {
  @override
  _SettingsForm5State createState() => _SettingsForm5State();
}

class _SettingsForm5State extends State<SettingsForm5> {
  int _selectedIndex = -1;

  final pages = [
    CalendarScreen(),
    const OverviewScreen(),
    TextbookScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> _days = [
    'ראשון',
    'שני',
    'שלישי',
    'רביעי',
    'חמישי',
    'שישי',
    'שבת',
  ];
  List<bool> _daysChecked = [false, false, false, false, false, false, false];

  List<String> _studyRates = [
    'פרק אחד',
  ];
  String? _selectedStudyRate;

  bool _allDayChecked = false;

  List<String> _chapters = [
    '',
  ];
  String? _selectedChapter;

  List<String> _sections = [
    '',
  ];
  String? _selectedSection;

  List<String> _parts = [
    '',
  ];
  String? _selectedPart;

  List<String> _books = [
    'Flutter',
    'Node.js',
    'React Native',
    'Java',
    'Docker',
    'MySQL',
    'React',
    'Angluar',
    'Django',
    'Blockchain',
  ];
  List<String> _selectedBooks = [];

  String _selectedAlarmTime = '';
  String _selectedRepeatTime = '';

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
      return Column(
        children: [
          AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                }),
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
          Container(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        const DefaultTextStyle(
                          style: TextStyle(decoration: TextDecoration.none),
                          child: Text(
                            "קביעת מסגרת הלימוד",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          title: Text(
                            'ש"ס בבלי',
                            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          trailing: Transform.rotate(
                            angle: 270 * 3.14 / 180,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Colors.grey),
                              bottom: BorderSide(width: 1.0, color: Colors.grey),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ימי לימוד',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                  children: _generateCheckboxes(_days, _daysChecked)
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'קצב לימוד יומי',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text('כמה פרקים ביום'),
                                  SizedBox(width: 8.0),
                                  SingleChoiceDropdownButton(
                                    options: _studyRates,
                                    selectedValue: _selectedStudyRate,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedStudyRate = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'תכנון לימוד',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      side: const BorderSide(color: Color(0xff585858)),
                                      value: _allDayChecked,
                                      onChanged: (checked) {
                                        setState(() {
                                          _allDayChecked = checked!;
                                        });
                                      },
                                    ),
                                    Text('כל הש"ס '),
                                  ]
                              ),
                              Row(
                                  children: [
                                    Text('מסכת'),
                                    SizedBox(width: 4.0),
                                    SingleChoiceDropdownButton(
                                      options: _parts,
                                      selectedValue: _selectedPart,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPart = value;
                                        });
                                      },
                                    ),
                                    SizedBox(width: 8.0),
                                    Text('דף'),
                                    SizedBox(width: 4.0),
                                    SingleChoiceDropdownButton(
                                      options: _sections,
                                      selectedValue: _selectedSection,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedSection = value;
                                        });
                                      },
                                    ),
                                  ]
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'ספרים',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text('מסכת'),
                                  SizedBox(width: 8.0),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: ElevatedButton.icon(
                                      onPressed: _showMultiSelect,
                                      style: ElevatedButton.styleFrom(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                        side: const BorderSide(color: Colors.black26),
                                        //Set the background color
                                        primary: Colors.white,
                                        //Set the foreground (text + icon) color
                                        onPrimary: Colors.black54,
                                        //Set the padding on all sides to 30px
                                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                                      ),
                                      icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14), //Button icon
                                      label: const Text("Select Books"),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Wrap(
                                children: _selectedBooks
                                    .map((e) => Chip(
                                  label: Text(e),
                                ))
                                    .toList(),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'תזכורת לימוד',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text('בשעה'),
                                  SizedBox(width: 4.0),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: ElevatedButton.icon(
                                      onPressed: () async {
                                        TimeOfDay? pickedTime =  await showTimePicker(
                                          initialTime: TimeOfDay.now(),
                                          context: context,
                                        );
                                        if (pickedTime != null ) {
                                          DateTime parsedTime = intl.DateFormat.jm().parse(pickedTime.format(context).toString());
                                          String formattedTime = intl.DateFormat('HH:mm:ss').format(parsedTime);
                                          setState(() {
                                            _selectedRepeatTime = formattedTime;
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                        side: const BorderSide(color: Colors.black26),
                                        //Set the background color
                                        primary: Colors.white,
                                        //Set the foreground (text + icon) color
                                        onPrimary: Colors.black54,
                                        //Set the padding on all sides to 30px
                                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                                      ),
                                      icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                                      label: Text(_selectedRepeatTime.isEmpty ? "Repeat Time" : _selectedRepeatTime),
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text('תזכורת חוזרת'),
                                  SizedBox(width: 4.0),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: ElevatedButton.icon(
                                      onPressed: () async {
                                        TimeOfDay? pickedTime =  await showTimePicker(
                                          initialTime: TimeOfDay.now(),
                                          context: context,
                                        );
                                        if (pickedTime != null ) {
                                          DateTime parsedTime = intl.DateFormat.jm().parse(pickedTime.format(context).toString());
                                          String formattedTime = intl.DateFormat('HH:mm:ss').format(parsedTime);
                                          setState(() {
                                            _selectedAlarmTime = formattedTime;
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                        side: const BorderSide(color: Colors.black26),
                                        //Set the background color
                                        primary: Colors.white,
                                        //Set the foreground (text + icon) color
                                        onPrimary: Colors.black54,
                                        //Set the padding on all sides to 30px
                                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                                      ),
                                      icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                                      label: Text(_selectedAlarmTime.isEmpty ? "Repeat Time" : _selectedAlarmTime),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
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
                        Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  child: Text(
                                    "התנתק",
                                  ),
                                  onPressed: () {
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    "מחק חשבון",
                                  ),
                                  onPressed: () {
                                  },
                                )
                              ],
                            )
                        )
                      ],
                    )
                )
            ),
          ),
        ],
      );
    } else {
      return pages[_selectedIndex];
    }
  }

  List<Widget> _generateCheckboxes(List<String> options, List<bool> optionsChecked) {
    List<Widget> checkboxes = [];

    options.asMap().forEach((index, option) => {
      checkboxes.add(
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: const BorderSide(color: Color(0xff585858)),
          value: optionsChecked[index],
          onChanged: (checked) {
            setState(() {
              optionsChecked[index] = checked!;
            });
          },
        ),
      ),
      checkboxes.add(Text(option))
    });

    return checkboxes;
  }

  void _showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _books);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedBooks = results;
      });
    }
  }

}