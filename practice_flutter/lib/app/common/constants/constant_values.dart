import 'package:flutter/material.dart';
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
  ButtonItem(
    buttonName: AppStrings.circularAnimationsTitle.translate(),
    buttonNavigation: AppRoutes.smoothCircleAnimation,
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
    title: 'Card Item $index',
  ),
);

List<CardItem> get iconCardItems => [
  const CardItem(
    icon: Icons.home,
    title: "Home",
    description: "Navigate to the main screen of the application",
  ),
  const CardItem(
    icon: Icons.settings,
    title: "Settings",
    description: "Access and modify application preferences",
  ),
  const CardItem(
    icon: Icons.favorite,
    title: "Favorite",
    description: "Mark items as your preferred choices",
  ),
  const CardItem(
    icon: Icons.search,
    title: "Search",
    description: "Find and filter content within the app",
  ),
  const CardItem(
    icon: Icons.notifications,
    title: "Notifications",
    description: "View and manage your app alerts",
  ),
    const CardItem(
    icon: Icons.person,
    title: "Profile",
    description: "Access your personal account information",
  ),
  const CardItem(
    icon: Icons.shopping_cart,
    title: "Cart",
    description: "View items you've added for purchase",
  ),
  const CardItem(
    icon: Icons.share,
    title: "Share",
    description: "Send content to other apps or contacts",
  ),
  const CardItem(
    icon: Icons.download,
    title: "Download",
    description: "Save files and content to your device",
  ),
  const CardItem(
    icon: Icons.delete,
    title: "Delete",
    description: "Remove items permanently from the app",
  ),
];

List<CardItem> get percyJacksonOlympiansBookItems => [
  const CardItem(
    title: "The Lightning Thief",
    description: "Percy is accused of stealing Zeus's lightning bolt and is sent to Camp Half-Blood to be kept safe.",
  ),
  const CardItem(
    title: "The Sea of Monsters",
    description: "Percy and his friends go on a quest to find the Golden Fleece to save Grover from the monster of the sea.",
  ),
  const CardItem(
    title: "The Titans Curse",
    description: "Percy forced his way to the quest to find Goddess Artemis and his friend Annabeth.",
  ),
  const CardItem(
    title: "The Battle of the Labyrinth",
    description: "The trio has to navigate the labyrinth to save the camp half-blood.",
  ),
  const CardItem(
    title: "The Last Olympian",
    description: "It's the Olympians v/s Titans final battle.",
  ),
];
