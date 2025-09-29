import 'dart:async';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  static const int totalSeconds = 10; //  total countdown time
  int remainingSeconds = totalSeconds;
  bool isPaused = false;
  Timer? timer;

  void setTimer() {
    setState(() {
      remainingSeconds = totalSeconds;
      isPaused = false;
    });
  }

  void cancelTimer() {
    timer?.cancel();
    if (!isPaused) {
      setState(() {
        remainingSeconds = totalSeconds;
      });
    }
  }

  void pauseTimer() {
    setState(() {
      isPaused = true;
    });
  }

  void resumeTimer() {
    setState(() {
      isPaused = false;
    });
    startTimer();
  }

  void startTimer() async {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }

      if (!isPaused && remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else if (remainingSeconds == 0) {
        cancelTimer();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF800080), Color(0xFFFFC0CB)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTimerWidget(context),
          Row(children: [_buildButtons()]),
        ],
      ),
    );
  }

  Widget _buildTimerWidget(BuildContext context) {
    final progress = remainingSeconds / totalSeconds;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: progress),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 10,
                backgroundColor: Color(0xFFFDEFF9),
                valueColor: AlwaysStoppedAnimation(Color(0xFF7303C0)),
              ),
            ),
            Text(
              "$remainingSeconds",
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }

  Widget _buildButtons() {
    final bool isIdle = remainingSeconds == totalSeconds;

    if (isIdle) {
      // 👉 Only show Start button
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: startTimer,
        child: const Text("Start"),
      );
    } else {
      // 👉 Show Pause/Resume + Cancel buttons
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: isPaused ? resumeTimer : pauseTimer,
            child: Text(isPaused ? "Resume" : "Pause"),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                isPaused = false;
              });
              cancelTimer();
            },
            child: const Text("Cancel"),
          ),
        ],
      );
    }
  }
}
