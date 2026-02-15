import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';

class SliverPracticePage extends StatelessWidget {
  const SliverPracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Sliver AppBar
          SliverAppBar(
            expandedHeight: 100,
            collapsedHeight: 70,
            pinned: true,
            flexibleSpace: CustomAppBarTitle(
              title: AppStrings.sliverPracticeTitle.translate(),
            ),
          ),

          // Horizontal scroll section
          SliverToBoxAdapter(
            child: SizedBox(
              height: 333,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing16),
                itemCount: sliverHorizontalCards.length,
                itemBuilder: (context, index) {
                  return ImageTextCard(item: sliverHorizontalCards[index]);
                },
                separatorBuilder: (_, __) => const SizedBox(width: 12),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Random containers for vertical scroll
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }, childCount: 5),
          ),
        ],
      ),
    );
  }
}
