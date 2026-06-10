import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final Alignment alignment;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color placeholderBackgroundColor;
  final Widget? placeholder;
  final IconData placeholderIcon;
  final double placeholderIconSize;
  final Color placeholderIconColor;
  final Widget? loadingWidget;
  final Color? loadingBackgroundColor;
  final Widget? errorWidget;
  final Color? errorBackgroundColor;
  final IconData? errorIcon;
  final double? errorIconSize;
  final Color? errorIconColor;
  final FilterQuality filterQuality;

  const NetworkImageWidget({
    super.key,
    this.imageUrl,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.borderRadius,
    this.placeholderBackgroundColor = AppColors.grey10,
    this.placeholder,
    this.placeholderIcon = Icons.image_outlined,
    this.placeholderIconSize = 48,
    this.placeholderIconColor = AppColors.grey,
    this.loadingWidget,
    this.loadingBackgroundColor,
    this.errorWidget,
    this.errorBackgroundColor,
    this.errorIcon = Icons.broken_image_outlined,
    this.errorIconSize = 48,
    this.errorIconColor = AppColors.error,
    this.filterQuality = FilterQuality.low,
  });

  bool get _hasValidUrl => imageUrl != null && imageUrl!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final content = _hasValidUrl ? _buildNetworkImage() : _buildPlaceholder();

    Widget child = SizedBox(width: width, height: height, child: content);

    if (borderRadius != null) {
      child = ClipRRect(borderRadius: borderRadius!, child: child);
    }

    return child;
  }

  Widget _buildNetworkImage() {
    return Image.network(
      imageUrl ?? '',
      fit: fit,
      alignment: alignment,
      filterQuality: filterQuality,
      width: width,
      height: height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildLoading();
      },
      errorBuilder: (_, __, ___) => _buildError(),
    );
  }

  Widget _buildPlaceholder() {
    return placeholder ??
        Container(
          color: placeholderBackgroundColor,
          alignment: Alignment.center,
          child: Icon(
            placeholderIcon,
            size: placeholderIconSize,
            color: placeholderIconColor,
          ),
        );
  }

  Widget _buildLoading() {
    return Container(
      color: loadingBackgroundColor ?? placeholderBackgroundColor,
      alignment: Alignment.center,
      child:
          loadingWidget ??
          const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
    );
  }

  Widget _buildError() {
    return errorWidget ??
        Container(
          color: errorBackgroundColor ?? placeholderBackgroundColor,
          alignment: Alignment.center,
          child: Icon(errorIcon, size: errorIconSize, color: errorIconColor),
        );
  }
}
