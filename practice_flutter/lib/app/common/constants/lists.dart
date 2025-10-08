import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class ButtonItem {
  final String buttonName;
  final String buttonNavigation;

  ButtonItem({required this.buttonName, required this.buttonNavigation});
}

List<ButtonItem> get homeButtons => [
  ButtonItem(
    buttonName: AppStrings.pageFlipAnimationTitle.translate(),
    buttonNavigation: AppRoutes.pageFlipAnimationTitle,
  ),
];
