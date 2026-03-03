import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/app/modules/fade_transition/cubit/sliding_cards_state.dart';

class SlidingCardsCubit extends Cubit<SlidingCardsState> {
  SlidingCardsCubit() : super(SlidingCardsState());

  void markCardAsAnimated(int index) {
    if (!state.hasAnimated(index)) {
      final updatedIndices = Set<int>.from(state.animatedCardIndices)
        ..add(index);
      emit(state.copyWith(animatedCardIndices: updatedIndices));
    }
  }
}
