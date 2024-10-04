import 'package:flutter/material.dart';

class TColors {
  TColors._();

//Basic color
  static const Color primary = Color(0xFFD7C3F1);
  static const Color secondary = Color(0xFFFF9A9E);
  static const Color red = Color(0xFFf37b67);
  static const Color accents = Color(0xFFb0c7ff);
  static const Color dash = Color(0xFFF5F5F5);
  static const Color onBoarding1 = Color(0xFF4A90E2);
  static const Color onBoarding2 = Color(0xFF7B4397);
  static const Color onBoarding3 = Color(0xFF00BFA6);
  static const Color kShadowColor = Color(0xFFD3D3D3);
  static const Color haut = Color(0xFF526799);
  static const Color bas = Color(0xFF526799);
  static const Color mili = Color(0xFFE4E5E6);
  static const Color navbar=  Color(0xff17203a);
  static const Color blanc=  Color(0xFFF5F5F5);
  static const Color bleu = Color(0xFF526799);
  static const Color blanc1 = Color(0xFFE6E9F0);
  static const Color blanc2 = Color(0xFFEFF1F5);



  //Gradiant color

  static const Gradient LinerGradient = LinearGradient(
      begin: Alignment.topCenter, // Début du dégradé en haut
      end: Alignment.bottomCenter, // Fin du dégradé en bas
      colors: [
        Color(0xFFE6E9F0),
        Color(0xFFEFF1F5),

      ]
  );
//Text color
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xff6c757d);
  static const Color textWight = Colors.white;

//Background colors
  static const Color light = Color(0xfff6f6f6);
  static const Color  dark= Color(0xff272727);
  static const Color  primaryBackground= Color(0xfff3f5ff);

  //Background Container colors
  static const Color lightContainer = Color(0xfff6f6f6);

  //Bottoms colors
  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color  buttonSecondary = Color(0xff6c757d);
  static const Color  buttonDisable = Color(0xffc4c4c4);

  //Border colors
  static const Color borderPrimary = Color(0xffd9d9d9);
  static const Color  borderSecondary = Color(0xffe6e6e6);

  //Error and violations colors
  static const Color error = Color(0xFFE74C3C);
  static const Color  susscess = Color(0xFF388E3C);
  static const Color  info = Color(0xFF3498DB);
  static const Color  warning = Color(0xFFF1C40F);

  //Neutral shade colors
  static const Color black = Color(0xff232323);
  static const Color  darkerGrey = Color(0xff4f4f4f);
  static const Color  darkGrey = Color(0xff939393);
  static const Color  grey = Color(0xffe0e0e0);
  static const Color  softGrey = Color(0xfff4f4f4);
  static const Color  lightGrey = Color(0xfff9f9f9);
  static const Color  white = Color(0xffffffff);
}

const panelTransition = Duration(milliseconds: 500);
