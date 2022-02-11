import 'package:expense_app_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import './routes/index.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  static const routes = {
    '/': SplashScreen(),
    HomeScreen.routeName: HomeScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return PageTransition(
          duration: const Duration(milliseconds: 400),
          type: PageTransitionType.fade,
          alignment: Alignment.centerRight,
          settings: settings,
          child: ExpenseApp.routes[settings.name]!,
        );
      },
    );
  }
}
