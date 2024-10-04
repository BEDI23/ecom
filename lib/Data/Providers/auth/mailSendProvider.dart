import 'package:ecom/Common/Widgets/auth/CustomSnackBar.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class mailSender extends ChangeNotifier {
  final TextEditingController mailsenderController = TextEditingController();

  void sendMailer(BuildContext context) {
    final email = mailsenderController.text.trim();

    if (_validateEmail(email)) {
      Navigator.pushReplacementNamed(context, '/otp');
    } else {
      _showErrorSnackBar(
          context, 'Veuillez entrer un email valide', Icons.error, TColors.red);
      return;    }
  }

  bool _validateEmail(String email) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }


  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
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
    mailsenderController.dispose();
    super.dispose();
  }
}
