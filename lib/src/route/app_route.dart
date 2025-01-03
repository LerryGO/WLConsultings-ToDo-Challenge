import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/route/todo/todo_route.dart';
import 'package:todo_challenge_2/src/ui/splash/splash_page.dart';

abstract class AppRoute {
  static const String splash = "/splash";
  static const String todo = "/todo";
  static const String todoDetail = "/todo/detail";
  static const String todoAdd = "/todo/add";

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashPage(),
    todo: (context) => TodoRoute.page,
  };
}
