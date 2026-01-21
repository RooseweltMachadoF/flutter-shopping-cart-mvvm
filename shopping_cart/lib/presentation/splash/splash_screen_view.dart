import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreenView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash" , style: TextStyle( fontSize: 22),),
      ),
    );
  }
}