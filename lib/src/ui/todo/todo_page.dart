import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/ui/task/task_list_tab.dart';
import 'package:todo_challenge_2/src/ui/todo/components/app_header.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _openModal() {
    final size = MediaQuery.sizeOf(context);
    showModalBottomSheet(
      constraints: BoxConstraints(
          maxHeight: size.height * 0.5, minHeight: size.height * 0.2),
      barrierColor: Colors.transparent,
      elevation: 0,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Criar task"),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPage(int index) async {
    _selectedIndex = index;

    _pageController.animateToPage(
      _selectedIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: AppHeader(),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              TaskListTab(),
              Center(child: Text('Search Page')),
              Center(child: Text('Done Page')),
            ],
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                      Icons.list, 'Todo', () => _navigateToPage(0), 0),
                  _buildNavItem(Icons.add, 'Create', () => _openModal(), -1),
                  _buildNavItem(
                      Icons.search, 'Search', () => _navigateToPage(1), 1),
                  _buildNavItem(
                      Icons.done, 'Done', () => _navigateToPage(2), 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, VoidCallback onTap, int index) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
