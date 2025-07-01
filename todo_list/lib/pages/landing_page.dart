import 'package:flutter/material.dart';
import 'package:todo_list/components/button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image(image: AssetImage('images/todo_image.jpg')),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[50]!, Colors.blue[50]!, Colors.white12],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Go Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.indigo[900], fontSize: 32),
                ),

                Text(
                  'A workspace to over 10 Million influencers around the globe.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[400], fontSize: 18),
                ),

                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Let's get started",
                      onPressed: () {
                        Navigator.pushNamed(context, '/home-page');
                      },
                      enabled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
