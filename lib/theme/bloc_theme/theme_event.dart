
import 'package:flutter/material.dart';

import '../theme_data/theme_data.dart';

@immutable
abstract class ThemeEvent {}

class GetThemeEvent extends ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {
  final AppTheme themeData;
  ThemeChangedEvent({required this.themeData});
}
