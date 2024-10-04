import 'package:ecom/Common/Widgets/auth/CustomSnackBar.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  void register(BuildContext context) {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String numero = numberController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || numero.isEmpty) {
      _showErrorSnackBar(
          context, 'Tous les champs doivent être remplis', Icons.error, TColors.red);
      return;
    }

    if (!isEmailValid(email)) {
      _showErrorSnackBar(
          context, 'Email invalide', Icons.error, TColors.red);
      return;
    }

    if (!isPasswordStrong(password)) {
      _showErrorSnackBar(
          context, 'Le mot de passe doit contenir au moins 8 caractères, dont une majuscule et un chiffre', Icons.error, TColors.red);
      return;
    }

    if (!isPhoneNumberValid(numero)) {
      _showErrorSnackBar(
          context, 'Le numéro de téléphone doit commencer par un "+" suivi du code pays et des chiffres', Icons.error, TColors.red);
      return;
    }

    Navigator.pushReplacementNamed(context, '/login');
  }

  bool isEmailValid(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool isPasswordStrong(String password) {
    return password.length >= 8 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'\d'));
  }

  bool isPhoneNumberValid(String numero) {
    String pattern = r'^\+\d{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(numero);
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
