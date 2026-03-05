# 🌀 Practice Flutter

A new Flutter project to explore **page flipping animations** and **3D transitions** using `AnimationController` and `AnimatedBuilder`.

---

## 🚀 Overview

This project demonstrates how to create a **page flip animation** in Flutter using 3D transformations.  
The key idea is to **render only one page at a time** for better performance — either the front or the back — based on the animation progress.

---

## 🧠 Core Concept

In `page_flip_builder.dart`, instead of directly passing **widgets**, we use **`WidgetBuilder`** parameters.  

### Why `WidgetBuilder`?
Because at any given moment, **only one side of the page (front or back)** is visible.  
By passing builders rather than full widget trees, we:
- Avoid building unnecessary widgets.
- Improve rendering performance.
- Allow the flip animation to dynamically decide which page to display.

---

## ⚙️ Animation Logic

To achieve the flip effect, we use the following components:

### 1. **`AnimationController`**
- Controls the flip transition duration and progress.
- Drives the animation value from `0` → `1`.
- Allows triggering flips programmatically (e.g., via button press).

### 2. **`AnimatedBuilder`**
- Rebuilds the UI based on animation progress.
- Applies **3D rotation transforms** (`Matrix4.rotationY`) to simulate a realistic page-flip effect.
- Determines which side (front or back) to render based on the current animation value.

---

## 🧩 Controller Details

To control the flipping behavior programmatically, we use an animation controller and a simple boolean flag.

### Steps:
1. **Define a variable** to track which side of the page is currently visible.
2. **Initialize the `AnimationController`** inside `initState`.
3. **Listen to animation status changes** to update the boolean (e.g., when the flip completes).
4. **Trigger the animation** programmatically whenever a flip action is required.

Example:
```dart
void flip() {
  if (_controller.isAnimating) return;
  _controller.forward(from: 0);
}

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


