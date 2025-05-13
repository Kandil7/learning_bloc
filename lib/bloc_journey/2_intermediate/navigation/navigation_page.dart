import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_state.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/pages/details_page.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/pages/home_page.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/pages/profile_page.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/pages/settings_page.dart';

/// Navigation Page
///
/// This page demonstrates how to use BLoC for navigation.
class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: const NavigationView(),
    );
  }
}

/// Navigation View
///
/// This widget contains the navigation UI and interacts with the NavigationBloc.
class NavigationView extends StatelessWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation with BLoC'),
      ),
      body: Column(
        children: [
          // Explanation text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This example demonstrates how to use BLoC for navigation. '
              'The BLoC manages the current page and any parameters needed for that page. '
              'The UI rebuilds based on the current page state.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          
          // Current page display
          Expanded(
            child: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                // Display the current page based on the state
                switch (state.currentPage) {
                  case AppPage.home:
                    return const HomePage();
                  case AppPage.profile:
                    return const ProfilePage();
                  case AppPage.settings:
                    return const SettingsPage();
                  case AppPage.details:
                    // Get the ID parameter from the state
                    final id = state.params['id'] as int? ?? 0;
                    return DetailsPage(id: id);
                }
              },
            ),
          ),
          
          // Code explanation
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Key Concepts:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('• BLoC for navigation: Manages the current page and parameters'),
                Text('• BlocBuilder: Rebuilds the UI based on the current page'),
                Text('• Navigation events: Trigger page transitions'),
                Text('• Navigation state: Tracks the current page and parameters'),
              ],
            ),
          ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        buildWhen: (previous, current) => 
            previous.currentPage != current.currentPage,
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: _getBottomNavIndex(state.currentPage),
            onTap: (index) => _onBottomNavTapped(context, index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }

  /// Get the bottom navigation index based on the current page
  int _getBottomNavIndex(AppPage page) {
    switch (page) {
      case AppPage.home:
        return 0;
      case AppPage.profile:
        return 1;
      case AppPage.settings:
        return 2;
      case AppPage.details:
        // Details page doesn't have a bottom nav item, so we return the home index
        return 0;
    }
  }

  /// Handle bottom navigation tap
  void _onBottomNavTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.read<NavigationBloc>().add(NavigateToHome());
        break;
      case 1:
        context.read<NavigationBloc>().add(NavigateToProfile());
        break;
      case 2:
        context.read<NavigationBloc>().add(NavigateToSettings());
        break;
    }
  }
}
