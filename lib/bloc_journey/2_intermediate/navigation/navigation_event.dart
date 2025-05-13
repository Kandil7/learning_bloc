/// Events for the NavigationBloc
///
/// These events represent navigation actions in the app.
sealed class NavigationEvent {}

/// Event to navigate to the home page
class NavigateToHome extends NavigationEvent {}

/// Event to navigate to the profile page
class NavigateToProfile extends NavigationEvent {}

/// Event to navigate to the settings page
class NavigateToSettings extends NavigationEvent {}

/// Event to navigate to the details page
///
/// This event includes an ID parameter to identify the item to display.
class NavigateToDetails extends NavigationEvent {
  final int id;

  NavigateToDetails(this.id);
}

/// Event to navigate back
class NavigateBack extends NavigationEvent {}
