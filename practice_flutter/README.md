# 🌀 Practice Flutter

A Flutter project exploring various **animations** and **UI transitions** using `AnimationController`, `AnimatedBuilder`, and advanced Flutter widgets.

---

## Animations Overview

This project demonstrates the following animations and UI patterns:

1. [Page Flip Animation](#page-flip-animation) - 3D page flip with Matrix4 transformations
2. [Sliver Practice](#sliver-practice) - CustomScrollView with Sliver widgets for efficient scrolling
3. [Fade Transition Demo](#fade-transition-demo) - Fade-in and slide animations with visibility-based card animations
4. [Circular Animations](#circular-animations) - Pulsing circle animation with dynamic color transitions
5. [Circular Revolving Animation](#circular-revolving-animation---positioning-logic) - Items revolve around in an orbit

---

## Page Flip Animation

### Concepts Used

- **`AnimationController`**: Controls the flip transition duration and progress
- **`AnimatedBuilder`**: Rebuilds UI based on animation progress
- **`Matrix4.rotationY`**: 3D rotation transformation for realistic page-flip effect
- **`WidgetBuilder`**: Lazy widget building for performance optimization
- **State Management**: Boolean flag to track which side is visible

### Implementation

The page flip animation uses a two-widget architecture:

#### 1. **`PageFlipBuilder`** (StatefulWidget)
- Manages the `AnimationController` lifecycle
- Tracks which side (front/back) is currently visible using `_showFrontSide` boolean
- Provides a public `flip()` method to trigger the animation
- Uses `WidgetBuilder` parameters instead of direct widgets for performance

**Key Code:**
```dart
void flip() {
  if (_showFrontSide) {
    _controller.forward();
  } else {
    _controller.reverse();
  }
}
```

#### 2. **`AnimatedPageFlipBuilder`** (StatelessWidget)
- Receives the animation value from the controller
- Determines which side to render based on animation progress (first half = front, second half = back)
- Applies 3D rotation transform using `Matrix4.rotationY`
- Calculates tilt effect for realistic perspective

**Key Code:**
```dart
final isAnimationFirstHalf = animation.value.abs() < 0.5;
final rotationAngle = isAnimationFirstHalf
    ? rotationValue
    : pi - rotationValue;
```

### Why `WidgetBuilder`?

At any given moment, **only one side of the page (front or back)** is visible. By passing builders rather than full widget trees, we:
- Avoid building unnecessary widgets
- Improve rendering performance
- Allow the flip animation to dynamically decide which page to display

---

## Sliver Practice

### Concepts Used

- **`CustomScrollView`**: Container for multiple sliver widgets
- **`SliverAppBar`**: App bar that can expand/collapse and pin to top
- **`SliverToBoxAdapter`**: Wraps regular widgets to use in sliver context
- **`SliverList`**: Efficient lazy-loading list for vertical scrolling
- **`FlexibleSpaceBar`**: Customizable space in SliverAppBar

### Implementation

The sliver practice page demonstrates a complex scrollable layout with:

1. **Sticky AppBar**: `SliverAppBar` with `pinned: true` stays at top while scrolling
2. **Horizontal Scroll Section**: `SliverToBoxAdapter` wrapping a horizontal `ListView` for card browsing
3. **Vertical Scroll Section**: `SliverList` with `SliverChildBuilderDelegate` for efficient lazy loading

**Key Benefits:**
- Efficient memory usage with lazy loading
- Smooth scrolling performance
- Flexible layout composition
- Single scroll physics for unified scrolling experience

---

## Fade Transition Demo

### Concepts Used

- **`FadeTransition`**: Opacity animation widget
- **`SlideTransition`**: Position offset animation widget
- **`CurvedAnimation`**: Custom animation curves (e.g., `Curves.easeIn`)
- **`Tween`**: Value interpolation between start and end states
- **`BlocProvider` & `BlocBuilder`**: State management for animation tracking
- **`ListView.builder`**: Efficient list rendering
- **Visibility-based Animation**: Cards animate only when first viewed

### Implementation

The fade transition demo consists of two main parts:

#### 1. **Title Animation** (`fade_transition_demo.dart`)
- Fades in from opacity 0 to 1
- Slides down from top (Offset(0, -1) to Offset.zero)
- Uses `CurvedAnimation` with `Curves.easeIn` for smooth motion
- Triggers automatically when page loads

**Key Code:**
```dart
_fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
    .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
```

#### 2. **Sliding Cards** (`sliding_cards_list.dart` & `sliding_card.dart`)
- Cards slide in from the right when first visible
- Each card has a staggered delay based on its index
- Uses `BlocProvider` and `SlidingCardsCubit` to track which cards have animated
- Prevents re-animation when scrolling back up

**Key Features:**
- **State Management**: `SlidingCardsCubit` maintains a `Set<int>` of animated card indices
- **One-time Animation**: Cards animate only once using `hasAnimated(index)` check
- **Staggered Delay**: `Duration(milliseconds: index * 100)` creates cascading effect
- **Performance**: Uses `ListView.builder` for efficient rendering

**Key Code:**
```dart
void markCardAsAnimated(int index) {
  if (!state.hasAnimated(index)) {
    final updatedIndices = Set<int>.from(state.animatedCardIndices)..add(index);
    emit(state.copyWith(animatedCardIndices: updatedIndices));
  }
}
```

---

## Circular Animations

### Concepts Used

- **`TickerProviderStateMixin`**: Provides multiple animation controllers
- **`Stack`**: Overlays multiple circles at center
- **`AnimatedBuilder`**: Rebuilds circles based on animation progress
- **`Color.lerp`**: Smooth color interpolation
- **Multiple `AnimationController`s**: One for spawning, one per circle
- **Dynamic Color Calculation**: Color changes based on radius position

### Implementation

The pulsing circle animation creates a continuous ripple effect:

#### **Pulsing Circle Animation** (`pulsing_circle_animation.dart`)

**Core Mechanism:**
1. **Spawn Controller**: Manages when new circles are created (every 1/5 of animation duration)
2. **Circle Controllers**: Each circle has its own `AnimationController` for independent growth
3. **Dynamic Color**: Color interpolates from dark (center) to light (outer) based on current radius
4. **Continuous Effect**: New circles spawn before previous ones complete, maintaining visible concentric circles

**Key Features:**
- **Dark Origin**: Circles start dark at center (size 0) and grow outward
- **Color Adaptation**: As circle grows, color matches the shade at that radius position
- **Continuous Spawning**: Multiple circles visible simultaneously for ripple effect
- **Automatic Cleanup**: Circles are removed and controllers disposed when animation completes

**Key Code:**
```dart
Color _getColorForRadius(double radiusProgress) {
  final darkCenter = Color.lerp(baseColor, Colors.black, 0.3)!;
  final lightOuter = Color.lerp(baseColor, Colors.white, 0.9)!;
  return Color.lerp(darkCenter, lightOuter, radiusProgress)!;
}
```

**Animation Flow:**
1. Initial circle spawns immediately
2. Spawn controller triggers new circle creation at intervals
3. Each circle animates from size 0 to full size
4. Color transitions from dark to light as radius increases
5. Circle is removed when animation completes
6. Process repeats continuously

---

## Common Patterns

### Animation Controller Setup
```dart
_controller = AnimationController(
  duration: const Duration(milliseconds: 800),
  vsync: this,
);
```

### Curved Animation
```dart
final curvedAnimation = CurvedAnimation(
  parent: _controller,
  curve: Curves.easeIn,
);
```

### Tween Animation
```dart
final animation = Tween<double>(begin: 0.0, end: 1.0)
    .animate(curvedAnimation);
```

### AnimatedBuilder Pattern
```dart
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform(
      transform: Matrix4.rotationY(animation.value * pi),
      child: child,
    );
  },
)
```


## Circular Revolving Animation - Positioning Logic

### Container Setup

The animation uses a `SizedBox` to define the total space needed:

```dart
totalSize = radius * 2 + itemSize * 2
center = totalSize / 2
```

**Example:** With `radius = 150` and `itemSize = 80`:
- `totalSize = 150 * 2 + 80 * 2 = 460`
- `center = 460 / 2 = 230`

### Circular Path Positioning

The circular path (border) needs to be centered within the container:

```dart
// Circle dimensions
circleWidth = radius * 2
circleHeight = radius * 2

// To center the circle in the container:
leftPosition = (totalSize - circleWidth) / 2
             = (radius * 2 + itemSize * 2 - radius * 2) / 2
             = itemSize

topPosition = itemSize  // Same calculation for vertical position
```

**Result:** The circle is positioned at `(itemSize, itemSize)`, which centers it perfectly in the container.

### Item Positioning

Items are positioned so their **centers** lie on the circular path:

```dart
// position.dx and position.dy are offsets from the circle center
// Circle center is at (center, center) = (230, 230)

itemCenterX = center + position.dx
itemCenterY = center + position.dy

// Positioned widget uses top-left corner, so we adjust:
left = itemCenterX - itemSize / 2
top = itemCenterY - itemSize / 2
```

**Key Points:**
- Items' **centers** coincide with the circular path
- Half of each item extends outside the circle (by `itemSize / 2`)
- Each item's position is calculated using:
  - **Base angle:** `(2π * index) / itemCount` - evenly spaces items
  - **Animation angle:** `baseAngle + (controller.value * 2π)` - adds rotation
  - **Trigonometric calculation:** `x = radius * sin(angle)`, `y = -radius * cos(angle)` 


---

## Project Structure

```
lib/app/modules/
├── page_flip/
│   ├── page_flip.dart
│   └── widgets/
│       ├── page_flip_builder.dart
│       └── animated_page_flip_builder.dart
├── slivers/
│   └── sliver_practice_page.dart
├── fade_transition/
│   ├── fade_transition_demo.dart
│   ├── cubit/
│   │   ├── sliding_cards_cubit.dart
│   │   └── sliding_cards_state.dart
│   └── widgets/
│       ├── sliding_cards_list.dart
│       └── sliding_card.dart
└── circular_animation/
    ├── circular_animation_view.dart
    └── widgets/
        └── pulsing_circle_animation.dart
```

---

## Theming

The project uses a consistent theming system:

- **Colors**: `AppColors` with generic naming (e.g., `green10`, `green20`, `green50`)
- **Text Styles**: `AppTextStyles` with descriptive names (e.g., `title18`, `bold24`, `normal16`)
- **Spacing**: `AppSpacing` with consistent values (e.g., `spacing8`, `spacing16`, `spacing24`)
- **Dark Mode**: All animations support both light and dark themes

---

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Navigate through animations from the home screen
4. Explore the code to understand implementation details

---

## Key Takeaways

- **Performance**: Use `WidgetBuilder` and lazy loading for better performance
- **State Management**: BLoC/Cubit pattern for complex animation state
- **Reusability**: Break animations into composable widgets
- **Efficiency**: Use `ListView.builder` and `SliverList` for long lists
- **Smooth Animations**: Combine `CurvedAnimation` with appropriate curves for natural motion
