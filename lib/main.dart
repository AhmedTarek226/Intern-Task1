import 'package:flutter/material.dart';
import 'package:intern_task1/screens/on_boarding_page.dart';
import 'package:intern_task1/screens/register_page.dart';
import 'package:intern_task1/screens/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: OnBoardingPage(),
      initialRoute: '/',
      routes: {
        '/': (ctx)=> const OnBoardingPage(),
        RegisterPage.routeName:(ctx) =>const RegisterPage(),
        SignInPage.routeName: (ctx) => const SignInPage(),
      },
    );
  }
}


