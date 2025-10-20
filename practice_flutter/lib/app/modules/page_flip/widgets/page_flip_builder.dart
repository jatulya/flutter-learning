import 'package:flutter/material.dart';

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
  // 2. Add state telling us which page we should show
  bool _showFrontSide = true;
  // 3. Our AnimationController
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    //_controller.addStatusListener(_updateStatus);
    // TODO: Temporary code, remove me
    _controller.addListener(() {
      print('value: ${_controller.value}');
    });
    super.initState();
  }

  @override
  void dispose() {
    // 6. Clean things up when the widget is removed
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    // 7. Toggle the state then a forward or reverse animation is complete
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() => _showFrontSide = !_showFrontSide);
    }
  }

  void flip() {
    print('CommitDebug: clicked $_showFrontSide');
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.frontBuilder(context);
  }
}
