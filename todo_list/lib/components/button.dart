import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled ? onPressed : null, // disabled if false
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(
          enabled ? Colors.blue : Colors.grey,
        ),
      ),
      child: Text(text),
    );
  }
}
