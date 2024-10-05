import 'package:ecom/Common/Widgets/homeScreen/CustomAppBarButton.dart';
import 'package:ecom/Data/Fixtures/category_fixture.dart';
import 'package:ecom/Data/Fixtures/product_data.dart';
import 'package:ecom/Screens/Home/HomeScreen/Search_field.dart';
import 'package:ecom/Screens/Home/HomeScreen/category_chip.dart';
import 'package:ecom/Screens/Home/HomeScreen/product_header.dart';
import 'package:ecom/Screens/Home/Promo_Widger/promo_banner.dart';
import 'package:ecom/Screens/Home/Promo_Widger/promo_carousel.dart';
import 'package:ecom/Screens/Home/product_widget/product_grid_view.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPromo = 0;
  late CarouselController carouselController;
  final List<PromoBanner> promoBanners = [
    const PromoBanner(
        promoText: "Get Your Special",
        promoImage: 'assets/images/promo1.png',
        promoDirection: TextDirection.ltr,
        promoBtnText: " Get Now",
        imageWidth: 110,
        titleColor: TColors.white,
        backgroundColor: TColors.bleu,
        buttonBackgroundColor: TColors.red,
        buttonTextColor: TColors.white),
    const PromoBanner(
        promoText: "Get Your Special",
        promoImage: 'assets/images/item2.png',
        promoDirection: TextDirection.rtl,
        promoBtnText: " Get Now",
        imageWidth: 110,
        titleColor: TColors.white,
        backgroundColor: TColors.secondary,
        buttonBackgroundColor: TColors.red,
        buttonTextColor: TColors.white),
    const PromoBanner(
        promoText: "Get Your Special",
        promoImage: 'assets/images/item3.png',
        promoDirection: TextDirection.ltr,
        promoBtnText: " Get Now",
        imageWidth: 110,
        titleColor: TColors.white,
        backgroundColor: TColors.primary,
        buttonBackgroundColor: TColors.red,
        buttonTextColor: TColors.white),
  ];

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: AppBarButton(
            iconData: Icons.menu,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: AppBarButton(
              iconData: Icons.shopping_bag,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: AppBarButton(
              iconData: Icons.shopping_bag,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          SearchField(),
          PromoCarousel(
            promoBanners: promoBanners,
            carouselController: carouselController,
            onPageChanged: (index) {
              setState(() {
                currentPromo = index;
              });
            },
          ),
          PromoCarouselIndicator(
              promoBanners: promoBanners,
              carouselController: carouselController,
              currentPromo: currentPromo),
          CategoryChip(
            categories: CategoryData.categories,
            onSelected: (category) {
              setState(() {
                CategoryData.setIsSelected(category.categoryId);
              });
            },
          ),
          const ProductHeader(),
          ProductGridView(products: ProductData.products,)
        ],
      ),
    );
  }
}
