import 'package:flutter/material.dart';
import 'package:todo_list/components/nav_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return BottomAppBar(
      shape: const CircularNotchedRectangle(), // Makes space for FAB
      notchMargin: 8.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            NavButton(
              icon: Icons.home,
              routeName: '/home-page',
            ),
            NavButton(
              icon: Icons.calendar_month,
              routeName: '/calender-page',
            ),
            SizedBox(width: 56), // Space for the floating button
            NavButton(
              icon: Icons.comment_outlined,
              routeName: '/comment-page',
            ),
            NavButton(
              icon: Icons.person,
              routeName: '/profile-page',
            ),
          ],
        ),
      ),
    );
  }
}
