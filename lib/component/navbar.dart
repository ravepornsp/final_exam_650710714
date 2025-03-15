import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;

  const BottomNavbar({Key? key, required this.currentIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    String routeName = '';

    if (index == 0) {
      routeName = '/profile';
    } else if (index == 1) {
      routeName = '/answer1';
    } else if (index == 2) {
      routeName = '/answer2';
    }

    if (routeName.isNotEmpty && ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_one_rounded),
          label: 'Answer1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_two_rounded),
          label: 'Answer2',
        ),
      ],
    );
  }
}
