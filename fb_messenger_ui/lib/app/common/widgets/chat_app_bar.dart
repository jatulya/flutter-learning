import 'package:fb_messenger_ui/app/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 100);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
    color: AppColors.blue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical:15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30, // Radius of the circle           
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/11.jpg',
                ),
              ),
              Text(
                "Chat",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white
                ),
              ),
              Icon(
                Icons.edit,
                color: AppColors.white
              )
            ],
          ),
        ),
      ),
    );
  }
}
