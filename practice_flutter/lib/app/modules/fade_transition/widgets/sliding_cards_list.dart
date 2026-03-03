import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/app/common/exports.dart';
import 'package:practice_flutter/app/common/extensions.dart';
import 'package:practice_flutter/app/models/scroll_section/card_item.dart';
import 'package:practice_flutter/app/modules/fade_transition/cubit/sliding_cards_cubit.dart';
import 'package:practice_flutter/app/modules/fade_transition/cubit/sliding_cards_state.dart';
import 'sliding_card.dart';

class SlidingCardsList extends StatelessWidget {
  final List<CardItem> items;

  const SlidingCardsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.green10 : AppColors.green90;

    return BlocProvider(
      create: (context) => SlidingCardsCubit(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing16,
              vertical: AppSpacing.spacing12,
            ),
            child: Text(
              AppStrings.slidingCardsHeading.translate(),
              style: AppTextStyles.bold24.copyWith(color: textColor),
            ),
          ),
          // Scrollable list
          BlocBuilder<SlidingCardsCubit, SlidingCardsState>(
            builder: (context, state) {
              final cubit = context.read<SlidingCardsCubit>();
              return Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SlidingCard(
                      item: items[index],
                      index: index,
                      isAnimated: state.hasAnimated(index),
                      onAnimationCompleted: cubit.markCardAsAnimated,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
