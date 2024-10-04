import 'package:ecom/Common/Widgets/auth/CustomSnackBar.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  final FocusNode otpFocusNode1 = FocusNode();
  final FocusNode otpFocusNode2 = FocusNode();
  final FocusNode otpFocusNode3 = FocusNode();
  final FocusNode otpFocusNode4 = FocusNode();

  void verifyOtp(BuildContext context) {
    String otp = otpController1.text.trim() +
        otpController2.text.trim() +
        otpController3.text.trim() +
        otpController4.text.trim();

    if (otp.length == 4) {
      Navigator.pushReplacementNamed(context, '/newPassword');
    } else {
      _showErrorSnackBar(
          context, 'Veuillez entrer un OTP valide', Icons.error, TColors.red);
    }
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
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    otpFocusNode1.dispose();
    otpFocusNode2.dispose();
    otpFocusNode3.dispose();
    otpFocusNode4.dispose();
    super.dispose();
  }
}
