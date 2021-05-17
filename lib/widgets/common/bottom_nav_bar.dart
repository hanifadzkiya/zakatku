import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakatku/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key, required this.onTap, required this.currentIndex,
  }) : super(key: key);

  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'About Me',
        )
      ],

    );
  }
}