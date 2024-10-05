import 'package:ecom/Screens/Auth/Login.dart';
import 'package:ecom/Screens/Auth/register.dart';
import 'package:ecom/Screens/Home/welcome/welcome.dart';
import 'package:ecom/Screens/OnBoarding/OnBoarding.dart';
import 'package:ecom/Screens/auth/newPassword.dart';
import 'package:ecom/Screens/auth/otp.dart';
import 'package:ecom/Screens/auth/sendMail.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/mail': (context) => const MailSend(),
        '/otp': (context) => const OtpPage(),
        '/newPassword': (context) => const NewPassword(),
        '/home': (context) => const HomeScreen(),
      },
      title: 'E-com',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}