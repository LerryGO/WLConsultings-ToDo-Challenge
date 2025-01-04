import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int _selectedIndex;
  final void Function(int)? _onItemTapped;

  const CustomBottomNavigationBar(
      {super.key,
      required int selectedIndex,
      required void Function(int)? onItemTap})
      : _selectedIndex = selectedIndex,
        _onItemTapped = onItemTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Todo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done),
          label: 'Done',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xFF007fff),
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }
}
