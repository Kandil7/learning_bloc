# Cupertino Design in Flutter

This section covers the implementation of iOS-style interfaces using Flutter's Cupertino widgets.

## Learning Objectives

- Understand iOS design principles and guidelines
- Implement Cupertino components in Flutter
- Create platform-adaptive UIs
- Apply iOS-specific navigation patterns

## Topics Covered

### iOS Design Principles

- **Clarity**: Focus on content with clean interfaces
- **Deference**: UI that helps users understand and interact with content
- **Depth**: Visual layers and realistic motion

### Cupertino Components

- **CupertinoNavigationBar**: iOS-style navigation bars
- **CupertinoButton**: iOS-style buttons
- **CupertinoContextMenu**: Long-press menus
- **CupertinoAlertDialog**: iOS-style alerts
- **CupertinoActionSheet**: Bottom action sheets
- **CupertinoSlider**: iOS-style sliders
- **CupertinoSwitch**: iOS-style toggle switches
- **CupertinoPicker**: Wheel-style pickers
- **CupertinoSegmentedControl**: Segmented controls for related options

### Platform-Adaptive Design

- **Detecting platforms**: Determining the current platform
- **Conditional widgets**: Using different widgets based on platform
- **Shared design elements**: Elements that work across platforms
- **Platform-specific customizations**: Tailoring the experience for each platform

### iOS-Specific Navigation

- **CupertinoTabBar**: Bottom tab navigation
- **CupertinoNavigationBar**: Top navigation with back button
- **CupertinoPageRoute**: iOS-style page transitions
- **CupertinoTabScaffold**: Tab-based navigation structure

### Cupertino Theming

- **CupertinoThemeData**: Defining a consistent iOS look
- **CupertinoColors**: Using iOS system colors
- **CupertinoIcons**: iOS-style icons
- **CupertinoTheme**: Applying themes to Cupertino widgets

## Implementation Examples

Each concept is demonstrated with practical examples showing:

1. Basic implementation
2. Customization options
3. Best practices
4. Platform-adaptive patterns

## Key Concepts

### Platform Detection

Detecting the current platform to provide the appropriate UI:

```dart
import 'dart:io' show Platform;

Widget buildButton() {
  if (Platform.isIOS) {
    return CupertinoButton(
      child: Text('iOS Button'),
      onPressed: () {},
    );
  } else {
    return ElevatedButton(
      child: Text('Material Button'),
      onPressed: () {},
    );
  }
}
```

### Cupertino App Structure

The basic structure of a Cupertino app:

```dart
CupertinoApp(
  theme: const CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue,
    brightness: Brightness.light,
  ),
  home: CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text('Cupertino App'),
    ),
    child: Center(
      child: Text('Hello, Cupertino!'),
    ),
  ),
)
```

### Platform-Adaptive Widgets

Creating widgets that adapt to the current platform:

```dart
class PlatformAdaptiveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PlatformAdaptiveButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text),
            onPressed: onPressed,
          )
        : ElevatedButton(
            child: Text(text),
            onPressed: onPressed,
          );
  }
}
```

## Resources

- [Human Interface Guidelines (iOS)](https://developer.apple.com/design/human-interface-guidelines/)
- [Flutter Cupertino Widgets](https://docs.flutter.dev/development/ui/widgets/cupertino)
- [Platform-Adaptive Apps](https://docs.flutter.dev/platform-integration/platform-adaptations)
- [Flutter Platform Widgets Package](https://pub.dev/packages/flutter_platform_widgets)
