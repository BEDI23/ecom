import 'package:ecom/Screens/Auth/Login.dart';
import 'package:ecom/Screens/Auth/register.dart';
import 'package:ecom/Screens/OnBoarding/OnBoarding.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(), // Page de connexion
        '/register': (context) => const Register(), // Page de connexion
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const OnBoarding(),
    );
  }
}