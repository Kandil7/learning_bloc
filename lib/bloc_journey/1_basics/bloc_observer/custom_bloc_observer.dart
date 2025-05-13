import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom BLoC Observer
///
/// BLoC Observer is used to observe all BLoC and Cubit instances in the application.
/// It provides hooks for various lifecycle events, such as creation, state changes,
/// event processing, transitions, errors, and closure.
class CustomBlocObserver extends BlocObserver {
  /// Constructor with optional debug flag and custom print function
  ///
  /// When debug is true, all events will be printed to the console
  /// The customPrint function allows redirecting print output
  const CustomBlocObserver({
    this.debug = true,
    this.customPrint,
  });

  /// Flag to enable/disable debug prints
  final bool debug;

  /// Optional custom print function
  final void Function(Object?)? customPrint;

  /// Internal print method that uses customPrint if provided, otherwise uses debugPrint
  void _print(Object? object) {
    if (customPrint != null) {
      customPrint!(object);
    } else {
      // Use debugPrint instead of print for better logging in Flutter
      debugPrint(object?.toString());
    }
  }

  /// Called when a BLoC or Cubit is created
  ///
  /// This is useful for tracking the lifecycle of BLoCs and Cubits
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (debug) {
      _print('🟢 onCreate -- ${bloc.runtimeType}');
    }
  }

  /// Called when a BLoC or Cubit emits a new state
  ///
  /// The change parameter contains the previous state and the current state
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (debug) {
      _print('🔄 onChange -- ${bloc.runtimeType}, $change');
    }
  }

  /// Called when a BLoC receives an event
  ///
  /// This is only called for BLoCs, not Cubits, as Cubits don't use events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (debug) {
      _print('📩 onEvent -- ${bloc.runtimeType}, $event');
    }
  }

  /// Called when a BLoC transitions from one state to another
  ///
  /// The transition contains the event, current state, and next state
  /// This is only called for BLoCs, not Cubits
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (debug) {
      _print('🔀 onTransition -- ${bloc.runtimeType}, $transition');
    }
  }

  /// Called when a BLoC or Cubit throws an error
  ///
  /// This is useful for error tracking and debugging
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (debug) {
      _print('❌ onError -- ${bloc.runtimeType}, $error');
      _print('StackTrace: $stackTrace');
    }
  }

  /// Called when a BLoC or Cubit is closed
  ///
  /// This is useful for tracking the lifecycle of BLoCs and Cubits
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (debug) {
      _print('🔴 onClose -- ${bloc.runtimeType}');
    }
  }
}
