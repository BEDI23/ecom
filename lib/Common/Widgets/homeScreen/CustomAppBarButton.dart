import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.iconData,
  });

  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: TColors.grey,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(8.0),
      ),
      onPressed: () {
      },
      child: Icon(
        iconData,
        color: TColors.bleu,
        size: 24.0, // Ajuste la taille de l'icône si nécessaire
      ),
    );
  }
}
