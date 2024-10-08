import 'package:ecom/Data/Entity/product.dart';

class ProductData {
  static List<Product> products = [
    Product(
      productId: 0,
      productName: " d'eau",
      productRating: 4.6,
      totalReview: 12,
      productPrice: 49.99,
      isFavourite: false,
      productCategoryId: [0, 3],
    ),
    Product(
      productId: 1,
      productName: "Colle rouler",
      productRating: 4.9,
      totalReview: 10,
      productPrice: 69.99,
      isFavourite: true,
      productCategoryId: [0, 4],
    ),
    Product(
      productId: 2,
      productName: "Machette",
      productRating: 4.3,
      totalReview: 6,
      productPrice: 55.99,
      isFavourite: false,
      productCategoryId: [1],
    ),
    Product(
      productId: 3,
      productName: "Marie chausser ",
      productRating: 5.0,
      totalReview: 23,
      productPrice: 74.99,
      isFavourite: true,
      productCategoryId: [0, 4],
    ),
  ];
}
