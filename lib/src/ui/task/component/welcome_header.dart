import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  final String _name;
  final String _message;
  const WelcomeHeader(
      {super.key, required String name, required String message})
      : _name = name,
        _message = message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Welcome, ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '$_name.',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Text(
            _message,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
