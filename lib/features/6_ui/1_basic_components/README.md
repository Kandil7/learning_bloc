# Basic UI Components

This section covers the fundamental UI components and layout principles in Flutter.

## Learning Objectives

- Understand Flutter's widget system
- Master basic layout widgets and their properties
- Learn about constraints and how they affect widget sizing
- Implement common UI patterns using basic widgets

## Topics Covered

### Widget Types

- **StatelessWidget**: For UI components that don't change state
- **StatefulWidget**: For UI components that can change over time

### Basic Widgets

- **Text**: Displaying and styling text
- **Image**: Displaying images from various sources
- **Icon**: Using built-in and custom icons
- **Button**: Different types of buttons (ElevatedButton, TextButton, OutlinedButton)
- **TextField**: Text input and form fields

### Layout Widgets

- **Container**: A convenience widget for common styling needs
- **Row**: Horizontal layout of children
- **Column**: Vertical layout of children
- **Stack**: Overlapping children
- **Expanded and Flexible**: Controlling how children expand to fill available space
- **Wrap**: Wrapping content to multiple lines

### Constraints and Sizing

- **BoxConstraints**: Understanding min/max width and height
- **SizedBox**: Explicit sizing
- **ConstrainedBox**: Applying additional constraints
- **UnconstrainedBox**: Removing constraints
- **AspectRatio**: Maintaining width/height ratio

### Box Model

- **Padding**: Adding space around widgets
- **Margin**: Using Container margin for spacing
- **Border**: Adding borders to widgets
- **BorderRadius**: Creating rounded corners

## Implementation Examples

Each concept is demonstrated with practical examples showing:

1. Basic implementation
2. Common customization options
3. Best practices
4. Common pitfalls to avoid

## Key Concepts

### The Widget Tree

Flutter UIs are built by composing widgets into a tree structure. Understanding this hierarchy is crucial for building complex UIs.

### The Build Method

The `build` method is where you define your UI. It's called whenever the widget needs to be rendered.

```dart
@override
Widget build(BuildContext context) {
  return Container(
    child: Text('Hello World'),
  );
}
```

### Constraints Flow

Constraints flow down the widget tree, and sizes flow back up. Parent widgets impose constraints on their children, and children determine their size within those constraints.

### The Box Model

Similar to CSS, Flutter widgets follow a box model with content, padding, border, and margin.

## Resources

- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Flutter Layout Cheat Sheet](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)
- [Understanding Constraints in Flutter](https://docs.flutter.dev/development/ui/layout/constraints)
