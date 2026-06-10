import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.carouselSliderTitle.translate()),
        centerTitle: true,
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: bookItems.length,
          options: CarouselOptions(
            height: 320,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enableInfiniteScroll: bookItems.length > 1,
            padEnds: true,
          ),
          itemBuilder: (context, index, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
              child: BookCard(item: bookItems[index]),
            );
          },
        ),
      ),
    );
  }
}
