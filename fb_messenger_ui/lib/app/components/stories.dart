import 'package:fb_messenger_ui/app/common/dummy_data.dart';
import 'package:fb_messenger_ui/app/common/styles/app_colors.dart';
import 'package:fb_messenger_ui/app/common/ui/user_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(
        20,
        15,
        20,
        0,
      ), 
        height: 110, // fixed height for avatars + text
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: storyList.length + 1, // +1 for "Your Story"
          itemBuilder: (context, index) {
            if (index == 0) {
              // "Your Story" tile
              return _buildYourStory();
            }

            final person = storyList[index - 1];
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: UserAvatar(user: person),
            );
          },
        ),
      ),
    );
  }

  Widget _buildYourStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.greyShadow,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 50,
            child: Text(
              "Your Story",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
