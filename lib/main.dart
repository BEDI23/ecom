import 'package:ecom/App/app.dart';
import 'package:ecom/Data/Providers/NavigationProvider.dart';
import 'package:ecom/Data/Providers/auth/loginProvider.dart';
import 'package:ecom/Data/Providers/auth/mailSendProvider.dart';
import 'package:ecom/Data/Providers/auth/registerProvider%20.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => mailSender()),
      ],
      child: const MyApp(),
    ),
  );
}
