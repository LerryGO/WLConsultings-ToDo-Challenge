import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_challenge_2/src/core/application_binding.dart';
import 'package:todo_challenge_2/src/core/todo_nav_global_key.dart';
import 'package:todo_challenge_2/src/route/app_route.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'To-Do App',
        navigatorKey: ToDoNavGlobalKey.instance.navKey,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('pt', 'BR'),
        supportedLocales: const [
          Locale('pt', 'BR'), // Português Brasil
        ],
        initialRoute: AppRoute.splash,
        routes: AppRoute.routes,
      ),
    );
  }
}
