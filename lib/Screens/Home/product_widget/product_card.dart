import 'package:ecom/Data/Entity/product.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ajoutez une action pour la navigation ou tout autre comportement ici
      },
      child: ProductCardItem(
        product: product,
      ),
    );
  }
}

class ProductCardItem extends StatefulWidget {
  const ProductCardItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageWithFavButton(
            productId: widget.product.productId,
            isFav: widget.product.isFavourite,
            onPressed: ()  {
              setState(() {
                widget.product.isFavourite = !widget.product.isFavourite;
              });
            },
          ),
          ProductReview(
            productRating: widget.product.productRating,
            totalReview: widget.product.totalReview,
          ),
          ProductName(
            productName: widget.product.productName,
          ),
          ProductPrice(
            productPrice: widget.product.productPrice,
          ),
        ],
      ),
    );
  }
}

class ProductImageWithFavButton extends StatelessWidget {
  const ProductImageWithFavButton({super.key, required this.productId, required this.isFav, required this.onPressed});

  final int productId;
  final bool isFav;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ProductImage(productId: productId),
        ProductFavButton(isFav: isFav, onPressed: () => onPressed(),
        ),
      ],
    );
  }
}

class ProductFavButton extends StatefulWidget {
  const ProductFavButton({
    super.key,
    required this.isFav, required this.onPressed,
  });

  final bool isFav;
  final VoidCallback onPressed;

  @override
  State<ProductFavButton> createState() => _ProductFavButtonState();
}

class _ProductFavButtonState extends State<ProductFavButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onPressed(),
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: TColors.white,
        minimumSize: const Size(10, 10),
      ),
      child: Icon(
        Icons.favorite , // Icône "favoris" corrigée
        color: widget.isFav ? TColors.red : TColors.grey,
        size: 16,
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: TColors.bleu,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Image.asset(
          'assets/images/item${productId + 1}.png',
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class ProductReview extends StatelessWidget {
  const ProductReview(
      {super.key, required this.productRating, required this.totalReview});

  final double productRating;
  final int totalReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 28,
        ),
        Text("$productRating ($totalReview avis)",
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              color: TColors.bleu,
            )),
      ],
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: GoogleFonts.poppins(
        fontSize: 16.0,
        color: TColors.bleu,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.productPrice});

  final double productPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$productPrice FCFA",
      style: GoogleFonts.poppins(
        fontSize: 16.0,
        color: TColors.bleu,
      ),
    );
  }
}
