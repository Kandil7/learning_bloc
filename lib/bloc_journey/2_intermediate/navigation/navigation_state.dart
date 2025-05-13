import 'package:equatable/equatable.dart';

/// Enum representing the different pages in the app
enum AppPage { home, profile, settings, details }

/// State for the NavigationBloc
///
/// This state contains information about the current page and any parameters
/// needed for that page.
class NavigationState extends Equatable {
  final AppPage currentPage;
  final Map<String, dynamic> params;

  /// Constructor for NavigationState
  const NavigationState({
    required this.currentPage,
    this.params = const {},
  });

  /// Initial state for navigation
  ///
  /// The initial page is the home page.
  factory NavigationState.initial() {
    return const NavigationState(currentPage: AppPage.home);
  }

  /// Create a copy of this state with the given parameters
  NavigationState copyWith({
    AppPage? currentPage,
    Map<String, dynamic>? params,
  }) {
    return NavigationState(
      currentPage: currentPage ?? this.currentPage,
      params: params ?? this.params,
    );
  }

  @override
  List<Object?> get props => [currentPage, params];
}
