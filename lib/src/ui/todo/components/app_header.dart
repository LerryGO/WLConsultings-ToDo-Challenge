import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            spacing: 8,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Text('Taski'),
            ],
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Text(
              "John",
              style: TextStyle(fontSize: 16),
            ),
            CircleAvatar(
              radius: 18,
              child: Icon(Icons.person),
            ),
          ],
        ),
      ],
    );
  }
}