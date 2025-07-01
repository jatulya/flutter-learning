import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final String routeName;

  const NavButton({
    super.key,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    final bool isSelected = currentRoute == routeName;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Navigator.pushNamed(context, routeName);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
