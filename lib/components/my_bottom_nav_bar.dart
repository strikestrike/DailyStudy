import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:round_icon/round_icon.dart';

import '../utils/constants.dart';

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
            size: selectedIndex == 0 ? 12.w : 10.w,
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
            size: selectedIndex == 1 ? 12.w : 10.w,
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
            size: selectedIndex == 2 ? 12.w : 10.w,
          ),
          label: 'מבחנים',
          backgroundColor: Colors.white,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex == -1 ? 0 : selectedIndex,
      selectedItemColor: ACTIVE_COLOR,
      unselectedItemColor: ACTIVE_COLOR,
      iconSize: 2.w,
      onTap: onItemTap,
      elevation: 5,
    );
  }
}