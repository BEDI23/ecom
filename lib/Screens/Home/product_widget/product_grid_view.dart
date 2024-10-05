import 'package:ecom/Data/Entity/product.dart';
import 'package:ecom/Screens/Home/product_widget/product_card.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Il n'y a pas de produit disponible \n pour cette categorie",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 14.0,
                    color: TColors.red),
              ),
            ],
          ));
    }

    return Expanded(
        flex: 6,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 5,
            childAspectRatio: 2 / 3.25,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
            );
          },
        ));
  }
}
