import 'package:fb_messenger_ui/app/common/styles/app_colors.dart';
import 'package:fb_messenger_ui/app/models/user.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final User user; 
  final double size;

  const UserAvatar({
    super.key,
    required this.user,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: user.viewedStory ? AppColors.blue : AppColors.greenLight,
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                radius: size / 2,
                backgroundImage: NetworkImage(user.imageUrl),
              ),
            ),
            if (user.isOnline)
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: size + 20,
          child: Text(
            user.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }
}
