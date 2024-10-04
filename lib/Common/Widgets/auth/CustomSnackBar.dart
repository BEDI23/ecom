import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    // Créer une instance de Overlay
    final overlay = Overlay.of(context);

    // Créer l'OverlayEntry
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 80, // Ajustez cette valeur pour positionner le SnackBar
        left: 20,
        right: 20,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: textColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Insérer l'OverlayEntry dans l'Overlay
    overlay.insert(overlayEntry);

    // Optionnel : Cacher le SnackBar après un certain temps
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
