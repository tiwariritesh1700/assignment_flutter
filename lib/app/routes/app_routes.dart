import 'package:flutter/material.dart';

import '../modules/home/home_screen.dart';
import '../modules/initial/start_screen.dart';
import '../modules/login/login_screen.dart';
import '../modules/todo/add_task_screen.dart';

class Routes {
  static const String INITIAL = START;
  static Map<String, WidgetBuilder> allRoutes = <String, WidgetBuilder>{
    LOGIN: (_) => const LoginScreen(),
    HOME: (_) => const HomeScreen(),
    START: (_) => const StartScreen(),
    ADD_TASK: (_) => const AddTaskScreen(),
  };


  static const String LOGIN = '/login';
  static const String HOME = '/home';
  static const String START = '/start';
  static const String ADD_TASK = '/add_task';
}
