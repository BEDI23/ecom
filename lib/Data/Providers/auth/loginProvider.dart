import 'package:flutter/material.dart';
import 'package:ecom/Common/Widgets/auth/CustomSnackBar.dart';
import 'package:ecom/Utils/constants/colors.dart';

class LoginProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Validation de l'email
    if (email.isEmpty) {
      _showErrorSnackBar(
          context, 'Veuillez entrer votre email', Icons.error, TColors.red);
      return;
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showErrorSnackBar(
          context, 'Veuillez entrer un email valide', Icons.error, TColors.red);
      return;
    }

    // Validation du mot de passe
    if (password.isEmpty) {
      _showErrorSnackBar(context, 'Veuillez entrer votre mot de passe',
          Icons.error, TColors.red);
      return;
    } else if (password.length < 6) {
      _showErrorSnackBar(
          context,
          'Le mot de passe doit comporter au moins 6 caractères',
          Icons.error,
          TColors.red);
      return;
    }

    // Si tout est correct, rediriger vers une autre page
    Navigator.pushNamed(context, '/home');
  }

  void _showErrorSnackBar(BuildContext context, String message, IconData icon,
      Color backgroundColor) {
    CustomSnackBar.show(
        context: context,
        message: message,
        icon: icon,
        backgroundColor: backgroundColor,
        iconColor: Colors.white,
        textColor: Colors.white);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
