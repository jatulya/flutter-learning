import 'package:flutter/material.dart';
import 'package:practice_flutter/app/modules/page_flip/widgets/animated_page_flip_builder.dart';

class PageFlipBuilder extends StatefulWidget {
  //widget builders are used so that we can dynamically change it during animation
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  const PageFlipBuilder({
    super.key,
    required this.frontBuilder,
    required this.backBuilder,
  });

  @override
  PageFlipBuilderState createState() => PageFlipBuilderState();
}

// Note: there's no underscore here as we want this State subclass to be public.
// This is so that we can call the flip() method from the outside.
class PageFlipBuilderState extends State<PageFlipBuilder>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.addStatusListener(_updateStatus);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() => _showFrontSide = !_showFrontSide);
    }
  }

  void flip() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPageFlipBuilder(
      //we are passinig the animation<double> value of the controller
      animation: _controller,
      showFrontSide: _showFrontSide,
      frontBuilder: widget.frontBuilder,
      backBuilder: widget.backBuilder,
    );
  }
}
