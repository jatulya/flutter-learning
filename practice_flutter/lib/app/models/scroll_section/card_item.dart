class CardItem {
  final String? imageUrl;
  final String? textToShow;

  const CardItem({
    this.imageUrl,
    this.textToShow,
  });

  CardItem copyWith({
    String? imageUrl,
    String? textToShow,
  }) {
    return CardItem(
      imageUrl: imageUrl ?? this.imageUrl,
      textToShow: textToShow ?? this.textToShow,
    );
  }
}
