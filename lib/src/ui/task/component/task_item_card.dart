import 'package:flutter/material.dart';

class TaskItemCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isCompleted;

  const TaskItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends State<TaskItemCard> {
  bool _isExpanded = false;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      activeColor: Colors.green,
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !_isExpanded,
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: _isExpanded
                  ? Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
