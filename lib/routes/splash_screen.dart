import 'dart:async';

import 'package:flutter/material.dart';

import './index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToHome(HomeScreen.routeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }

  void moveToHome(String routeName) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(routeName);
    });
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            strokeWidth: 8.0,
            value: Tween(begin: 0.0, end: 1.0)
                .animate(CurvedAnimation(
                    parent: _animationController, curve: Curves.decelerate))
                .value,
          ),
        ),
      ],
    )));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class LoadUser extends StatefulWidget {
  const LoadUser({Key? key}) : super(key: key);

  @override
  _LoadUserState createState() => _LoadUserState();
}

class _LoadUserState extends State<LoadUser> {
  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}
