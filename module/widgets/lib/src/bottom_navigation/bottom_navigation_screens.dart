import 'package:flutter/material.dart';

class BottomNavigationScreens extends StatelessWidget {
  const BottomNavigationScreens({
    required this.pages,
    required this.selectedPageIndex,
    super.key,
  });

  final List<Widget> pages;
  final int selectedPageIndex;

  @override
  Widget build(BuildContext context) {
    return pages[selectedPageIndex];
  }
}
