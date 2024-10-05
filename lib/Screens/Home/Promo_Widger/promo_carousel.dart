import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Screens/Home/Promo_Widger/promo_banner.dart';
import 'package:ecom/Utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({
    super.key,
    required this.promoBanners,
    required this.carouselController,
    required this.onPageChanged,
  });

  final List<PromoBanner> promoBanners;
  final CarouselController carouselController;
  final dynamic Function(int) onPageChanged;

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.promoBanners,
      options: CarouselOptions(
        viewportFraction: 1.0,
        aspectRatio: 21 / 9.5,
        autoPlay: true,
        onPageChanged: (index, reason) => widget.onPageChanged(index),
      ),
    );
  }
}

class PromoCarouselIndicator extends StatelessWidget {
  const PromoCarouselIndicator({
    super.key,
    required this.promoBanners,
    required this.carouselController,
    required this.currentPromo,
  });

  final List<PromoBanner> promoBanners;
  final CarouselController carouselController;
  final int currentPromo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: promoBanners.asMap().entries.map((entry) {
        int index = entry.key;
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: currentPromo == index ? 10.0 : 5.0,
            height: 5.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPromo == index
                  ? TColors.red
                  : TColors.red
                      .withOpacity(currentPromo == entry.key ? 0.9 : 0.3),
            ),
          ),
        );
      }).toList(),
    );
  }
}
