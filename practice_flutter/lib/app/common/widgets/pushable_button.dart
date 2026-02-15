import 'package:flutter/material.dart';
import 'package:practice_flutter/app/common/exports.dart';

class PushableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const PushableButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  State<PushableButton> createState() => _PushableButtonState();
}

class _PushableButtonState extends State<PushableButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _isPressed ? 10 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.lightPrimary,
          borderRadius: BorderRadius.circular(AppSpacing.spacing32),
          boxShadow: _isPressed
              ? []
              : [
                  const BoxShadow(
                    color: AppColors.darkAccent,
                    offset: Offset(0, 8),
                    blurRadius: 0,
                  ),
                ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.spacing16,
          horizontal: AppSpacing.spacing24,
        ),
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing32),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.lightBackground,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
