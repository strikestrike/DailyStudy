import 'package:dailystudy/views/settings/settings_form3.dart';
import 'package:dailystudy/views/settings/settings_form4.dart';
import 'package:dailystudy/views/settings/settings_form5.dart';
import 'package:dailystudy/views/settings/settings_form6.dart';
import 'package:dailystudy/views/settings/settings_form7.dart';
import 'package:dailystudy/views/settings/settings_form8.dart';
import 'package:flutter/material.dart';
import '../../components/expandable_list_item.dart';
import '../../components/my_bottom_nav_bar.dart';
import '../calendar_page.dart';
import '../overview_page.dart';
import '../textbook_page.dart';
import 'settings_form2.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  _SettingScreenState createState() => new _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
            Material(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Card(
                          child:ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsForm8()));
                              },
                              title: Text('תורה (שמו"ת)'),
                              trailing: Icon(Icons.arrow_back_ios_rounded)
                          )
                      ),
                      Card(
                          child:ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsForm7()));
                              },
                              title: Text('נ"ך'),
                              trailing: Icon(Icons.arrow_back_ios_rounded)
                          )
                      ),
                      Card(
                          child:ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsForm6()));
                              },
                              title: Text('משניות'),
                              trailing: Icon(Icons.arrow_back_ios_rounded)
                          )
                      ),
                      Card(
                          child:ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsForm5()));
                              },
                              title: Text('ש"ס בבלי'),
                              trailing: Icon(Icons.arrow_back_ios_rounded)
                          )
                      ),
                      Card(
                          child:ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsForm4()));
                              },
                              title: Text('ש"ס ירושלמי'),
                              trailing: Icon(Icons.arrow_back_ios_rounded)
                          )
                      ),
                      Card(
                          child:ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsForm3()));
                              },
                              title: Text('הלכה שו"ע'),
                              trailing: Icon(Icons.arrow_back_ios_rounded)
                          )
                      ),
                      Card(
                          child:ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsForm2()));
                              },
                              title: Text('רמב"ם היד החזקה'),
                              trailing: Icon(Icons.arrow_back_ios_rounded)
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        );
    } else {
      return pages[_selectedIndex];
    }
  }

}