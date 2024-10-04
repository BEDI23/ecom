import 'package:flutter/material.dart';
import 'package:ecom/Common/Widgets/auth/CustomSnackBar.dart';
import 'package:ecom/Utils/constants/colors.dart';

class NewPasswordProvider extends ChangeNotifier {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void updatePassword(BuildContext context) {
    String newPassword = newPasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      _showErrorSnackBar(context, "Les champs ne doivent pas être vides", Icons.error);
      return;
    }

    if (!isPasswordStrong(newPassword)) {
      _showErrorSnackBar(
        context,
        'Le mot de passe doit contenir au moins 8 caractères, dont une majuscule et un chiffre',
        Icons.error,
      );
      return;
    }

    if (newPassword != confirmPassword) {
      _showErrorSnackBar(context, "Les mots de passe ne correspondent pas", Icons.error);
      return;
    }

    // Ici, ajoutez la logique pour mettre à jour le mot de passe dans le backend.
    Navigator.pushReplacementNamed(context, '/login'); // Par exemple, redirection après succès
  }

  bool isPasswordStrong(String password) {
    return password.length >= 8 &&
        password.contains(RegExp(r'[A-Z]')) && // Vérifie la présence d'une majuscule
        password.contains(RegExp(r'\d')); // Vérifie la présence d'un chiffre
  }

  void _showErrorSnackBar(BuildContext context, String message, IconData icon) {
    CustomSnackBar.show(
      context: context,
      message: message,
      icon: icon,
      backgroundColor: TColors.red,
      iconColor: Colors.white,
      textColor: Colors.white,
    );
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
