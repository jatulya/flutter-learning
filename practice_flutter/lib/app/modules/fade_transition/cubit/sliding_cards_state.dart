class SlidingCardsState {
  final Set<int> animatedCardIndices;

  SlidingCardsState({Set<int>? animatedCardIndices})
    : animatedCardIndices = animatedCardIndices ?? {};

  SlidingCardsState copyWith({Set<int>? animatedCardIndices}) {
    return SlidingCardsState(
      animatedCardIndices: animatedCardIndices ?? this.animatedCardIndices,
    );
  }

  bool hasAnimated(int index) {
    return animatedCardIndices.contains(index);
  }
}