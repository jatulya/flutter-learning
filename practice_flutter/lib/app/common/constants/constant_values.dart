import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';
import 'package:practice_flutter/app/models/scroll_section/card_item.dart';

class ButtonItem {
  final String buttonName;
  final String buttonNavigation;

  ButtonItem({required this.buttonName, required this.buttonNavigation});
}

List<ButtonItem> get homeButtons => [
  ButtonItem(
    buttonName: AppStrings.pageFlipAnimationTitle.translate(),
    buttonNavigation: AppRoutes.pageFlip,
  ),
  ButtonItem(
    buttonName: AppStrings.sliverPracticeTitle.translate(),
    buttonNavigation: AppRoutes.sliverPractice,
  ),
  ButtonItem(
    buttonName: AppStrings.fadeTransitionButtonTitle.translate(),
    buttonNavigation: AppRoutes.fadeTransition,
  ),
];

class Images {
  final String lightModeImage;
  final String darkModeImage;

  Images({required this.lightModeImage, required this.darkModeImage});
}

List<Images> get pageFlipImages => [
  //profile
  Images(
    darkModeImage:
        "https://images.unsplash.com/vector-1743321182619-a3a4279a911b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fHww",
    lightModeImage:
        "https://images.unsplash.com/vector-1743321182619-a3a4279a911b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fHww",
  ),
  //center image
  Images(
    darkModeImage:
        "https://images.unsplash.com/vector-1753252769959-ef0b3d159379?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmlnaHQlMjBza3l8ZW58MHx8MHx8fDA%3D",
    lightModeImage:
        "https://images.unsplash.com/vector-1758527144432-e916b7c7cb82?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZGF5JTIwc2t5fGVufDB8fDB8fHww",
  ),
];

List<CardItem> sliverHorizontalCards = List.generate(
  10,
  (index) => CardItem(
    imageUrl: 'https://picsum.photos/300/400?random=$index',
    textToShow: 'Card Item $index',
  ),
);
