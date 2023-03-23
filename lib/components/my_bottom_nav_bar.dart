import 'package:flutter/material.dart';
import 'package:round_icon/round_icon.dart';

class MyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTap;

  const MyBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: RoundIcon(
            icon: Icons.calendar_month_outlined,
            backgroundColor:
            selectedIndex == 0 ? Colors.blue : Colors.transparent,
            iconColor: selectedIndex == 0 ? Colors.white : Colors.blue,
            size: selectedIndex == 0 ? 60 : 40,
          ),
          label: 'לוח שנה',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: RoundIcon(
            icon: Icons.sticky_note_2_outlined,
            backgroundColor:
            selectedIndex == 1 ? Colors.blue : Colors.transparent,
            iconColor: selectedIndex == 1 ? Colors.white : Colors.blue,
            size: selectedIndex == 1 ? 60 : 40,
          ),
          label: 'לימוד יומי',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: RoundIcon(
            icon: Icons.question_answer_outlined,
            backgroundColor:
            selectedIndex == 2 ? Colors.blue : Colors.transparent,
            iconColor: selectedIndex == 2 ? Colors.white : Colors.blue,
            size: selectedIndex == 2 ? 60 : 40,
          ),
          label: 'מבחנים',
          backgroundColor: Colors.white,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex == -1 ? 0 : selectedIndex,
      selectedItemColor: const Color(0xff009ACB),
      unselectedItemColor: const Color(0xff009ACB),
      iconSize: 35,
      onTap: onItemTap,
      elevation: 5,
    );
  }
}