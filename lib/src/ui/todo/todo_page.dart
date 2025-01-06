import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/ui/task/task_list_tab.dart';
import 'package:todo_challenge_2/src/ui/todo/components/app_header.dart';
import 'package:todo_challenge_2/src/ui/todo/components/custom_bottom_navigation_bar.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppHeader(),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          TaskListTab(),
          Center(
            child: Text('Create Page'),
          ),
          Center(
            child: Text('Search Page'),
          ),
          Center(
            child: Text('Done Page'),
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTap: _onItemTapped,
      ),
    );
  }
}
