import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: TColors.grey,
          borderRadius: BorderRadius.circular(40.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.search_rounded,color: TColors.red,weight: 20,),
              SizedBox(width: 8,),
              Text('Search', style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
