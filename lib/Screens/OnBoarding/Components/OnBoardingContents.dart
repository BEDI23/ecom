import 'package:ecom/Utils/constants/colors.dart';
import 'package:ecom/Utils/helpers/Image_OnBoarding.dart';
import 'package:ecom/Utils/helpers/text_OnBoarding.dart';
import 'package:flutter/material.dart';


class OnBoardingContent {
  final String image;
  final String title;
  final String description;
  final Color backgroundColor;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

List<OnBoardingContent> contentsList = [
  OnBoardingContent(
    image: TImages.onBoardingImage1,
    title: TText.onBoardingTitle1,
    description: TText.onBoardingSubTitle1,
    backgroundColor: TColors.blanc2,
  ),
  OnBoardingContent(
    image: TImages.onBoardingImage2,
    title: TText.onBoardingTitle2,
    description: TText.onBoardingSubTitle2,
    backgroundColor: TColors.blanc2,
  ),
  OnBoardingContent(
    image: TImages.onBoardingImage3,
    title: TText.onBoardingTitle3,
    description: TText.onBoardingSubTitle3,
    backgroundColor: TColors.blanc2,
  ),
];
