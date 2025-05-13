import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_state.dart';

/// BLoC for navigation
///
/// This BLoC handles navigation logic, including page transitions and parameters.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  /// Initialize the BLoC with the initial state
  NavigationBloc() : super(NavigationState.initial()) {
    // Register event handlers
    on<NavigateToHome>(_onNavigateToHome);
    on<NavigateToProfile>(_onNavigateToProfile);
    on<NavigateToSettings>(_onNavigateToSettings);
    on<NavigateToDetails>(_onNavigateToDetails);
    on<NavigateBack>(_onNavigateBack);
  }

  /// Handle the navigate to home event
  void _onNavigateToHome(NavigateToHome event, Emitter<NavigationState> emit) {
    emit(state.copyWith(currentPage: AppPage.home));
  }

  /// Handle the navigate to profile event
  void _onNavigateToProfile(NavigateToProfile event, Emitter<NavigationState> emit) {
    emit(state.copyWith(currentPage: AppPage.profile));
  }

  /// Handle the navigate to settings event
  void _onNavigateToSettings(NavigateToSettings event, Emitter<NavigationState> emit) {
    emit(state.copyWith(currentPage: AppPage.settings));
  }

  /// Handle the navigate to details event
  ///
  /// This event includes an ID parameter to identify the item to display.
  void _onNavigateToDetails(NavigateToDetails event, Emitter<NavigationState> emit) {
    emit(state.copyWith(
      currentPage: AppPage.details,
      params: {'id': event.id},
    ));
  }

  /// Handle the navigate back event
  ///
  /// This is a simplified implementation that always goes back to the home page.
  /// In a real app, you would maintain a navigation stack.
  void _onNavigateBack(NavigateBack event, Emitter<NavigationState> emit) {
    emit(state.copyWith(currentPage: AppPage.home));
  }
}
