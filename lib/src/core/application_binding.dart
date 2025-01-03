import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database_helper.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => DatabaseHelper(),
        ),
      ],
      builder: (context, _) {
        return FutureBuilder(
          future: Provider.of<DatabaseHelper>(context, listen: false)
              .initializeDatabase(),
          builder: (context, snapshot) {
            return child;
          },
        );
      },
    );
  }
}
