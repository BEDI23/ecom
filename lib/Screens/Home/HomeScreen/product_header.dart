import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Product",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 14.0,
                  color: TColors.bleu)),
          InkWell(
            onTap: () {},
            child: Text("View all",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 14.0,
                    color: TColors.red)),
          ) // Taille de police, // Couleur du texte)
        ],
      ),
    );
  }
}
