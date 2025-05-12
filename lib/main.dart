import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mastery/core/config/app_config.dart';
import 'package:flutter_mastery/core/di/injection_container.dart' as di;
import 'package:flutter_mastery/core/theme/app_theme.dart';
import 'package:flutter_mastery/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_mastery/generated/l10n.dart';

import 'core/utils/bloc_observer.dart';

/// FlutterMastery - A comprehensive Flutter learning project
///
/// This application is designed to provide a structured learning path for Flutter development,
/// with a focus on BLoC pattern, clean architecture, and design patterns.
///
/// The project is organized into a progressive learning path:
/// 1. Fundamentals: Basic Flutter concepts and simple state management
/// 2. State Management: Deep dive into BLoC pattern and state management
/// 3. Architecture: Advanced architectural patterns and clean architecture
/// 4. Design Patterns: Common design patterns implemented in Flutter
/// 5. Real-World Applications: Complete applications demonstrating all concepts
void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize app configuration
  await AppConfig.initialize();

  // Initialize dependency injection
  await di.init();

  // Set up BLoC observer for debugging and monitoring BLoC events
  Bloc.observer = const AppBlocObserver();

  // Run the application
  runApp(const FlutterMasteryApp());
}

/// The root widget of the application
///
/// This widget sets up the application theme, localization, and routing.
class FlutterMasteryApp extends StatelessWidget {
  const FlutterMasteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application title
      title: 'Flutter Mastery',

      // Remove the debug banner
      debugShowCheckedModeBanner: false,

      // Set the application theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Set up localization
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      // Set the home page to the dashboard
      home: const DashboardPage(),
    );
  }
}
