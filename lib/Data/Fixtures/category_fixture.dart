import 'package:ecom/Data/Entity/category.dart';

class CategoryData {
  static List<Category> categories = [
    Category(categoryId: 0, categoryName: "Popular", isSelected: true),
    Category(categoryId: 1, categoryName: "boisson"),
    Category(categoryId: 2, categoryName: "Artefacte"),
    Category(categoryId: 3, categoryName: "primo"),
    Category(categoryId: 4, categoryName: "Habie"),
  ];

  static Category getSelectedCategory() {
    return categories.firstWhere((element) => element.isSelected);
  }

  static void setIsSelected(int categoryId) {
    for (var category in categories) {
      category.isSelected = category.categoryId == categoryId;
    }
  }
}
