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
