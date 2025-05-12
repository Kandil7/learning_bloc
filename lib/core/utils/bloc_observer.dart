import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom BLoC observer for monitoring BLoC events
/// 
/// This observer logs BLoC events, state changes, and errors to the console.
/// It's useful for debugging and understanding the flow of events in the application.
class AppBlocObserver extends BlocObserver {
  /// Create a new instance of AppBlocObserver
  const AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
