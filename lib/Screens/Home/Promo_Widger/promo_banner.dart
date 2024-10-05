import 'package:ecom/Utils/constants/colors.dart'; // Assurez-vous que TColors renvoie bien un Color
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    super.key,
    required this.promoText,
    required this.promoImage,
    required this.promoDirection,
    required this.promoBtnText,
    required this.imageWidth,
    required this.titleColor,
    required this.backgroundColor,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
  });

  final String promoText;
  final String promoImage;
  final TextDirection promoDirection;
  final String promoBtnText;
  final double imageWidth;
  final Color titleColor;
  final Color backgroundColor;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
      child: Card(
        elevation: 0,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      promoText,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0, // Taille de police
                        color: titleColor, // Couleur du texte
                      ),
                    ),
                    const SizedBox(height: 30), // Espacement entre texte et bouton
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ), // Padding du bouton
                      ),
                      child: Text(
                        promoBtnText,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          color: buttonTextColor, // Couleur du texte du bouton
                        ),
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
              Image.asset(
                promoImage,
                width: imageWidth,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
