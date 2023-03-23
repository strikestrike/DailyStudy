import 'package:flutter/material.dart';
import '../components/my_bottom_nav_bar.dart';
import 'textbook_page.dart';
import 'overview_page.dart';
import 'calendar_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

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
      body: pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTap: (index) {
          _onItemTap(index);
        },
      ),
    );
  }

}