import 'package:ecom/Data/Entity/product.dart';
import 'package:ecom/Screens/Home/product_widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.products});

final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5,
              childAspectRatio: 2 / 3.25,
            ),
          padding: EdgeInsets.symmetric(horizontal:16.0 ),
          itemCount: products.length,
          itemBuilder: (context,index){
              return ProductCard(product: products[index],);
          },
        )
    );
  }
}
