import 'package:ecom/Data/Entity/category.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip(
      {super.key, required this.categories, required this.onSelected, });

  final List<Category> categories;
  final void Function(Category) onSelected;

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.categories.map((category){
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: ChoiceChip(
              avatar: null,
              label: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(category.categoryName),
              ),
              selected: category.isSelected,
                onSelected: (value) => widget.onSelected(category),
              selectedColor: TColors.red,
              labelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
                color: TColors.white
            ),
              backgroundColor: TColors.bleu,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: category.isSelected ? Colors.transparent : TColors.bleu
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          );
        }).toList()
      ),
    );
  }
}
