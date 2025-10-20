# practice_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

in page_flip_builder.dart 
we gave WidgetBuilder parameters instead of Widgets. This is because we are seeing only one screen at any time. 
so it is more performance boost to use widgetbuilder and let the pageFlipBuilder call the correct one.

to animate, we use the following
-- animationcontroller to control the flip transition
-- animationbuilder to rotate the front/back page with 3D transform, based on animation value
we pass the controller as input to the builder

controller  (programatically)
-- we need a variable to tell which page should we show
-- controller
