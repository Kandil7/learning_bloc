import 'package:flutter/material.dart';

/// A widget showcasing Material Design navigation patterns in Flutter
///
/// This widget demonstrates:
/// - Bottom Navigation Bar
/// - Tabs
/// - Drawers
/// - App Bars
class MaterialNavigationShowcase extends StatefulWidget {
  /// Creates a new Material navigation showcase
  const MaterialNavigationShowcase({Key? key}) : super(key: key);

  @override
  State<MaterialNavigationShowcase> createState() => _MaterialNavigationShowcaseState();
}

class _MaterialNavigationShowcaseState extends State<MaterialNavigationShowcase> {
  int _currentBottomNavIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Bottom Navigation Bar'),
        _buildBottomNavigationSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Tabs'),
        _buildTabsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Navigation Drawer'),
        _buildDrawerSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'App Bar Navigation'),
        _buildAppBarNavigationSection(),
      ],
    );
  }

  /// Builds a section title
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  /// Builds the bottom navigation section
  Widget _buildBottomNavigationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bottom navigation bars allow movement between primary destinations in an app.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: Text(
                        'Screen ${_currentBottomNavIndex + 1}',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  BottomNavigationBar(
                    currentIndex: _currentBottomNavIndex,
                    onTap: (index) {
                      setState(() {
                        _currentBottomNavIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Material 3 Navigation Bar:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: Text(
                        'Screen ${_currentBottomNavIndex + 1}',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  NavigationBar(
                    selectedIndex: _currentBottomNavIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        _currentBottomNavIndex = index;
                      });
                    },
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.search_outlined),
                        selectedIcon: Icon(Icons.search),
                        label: 'Search',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.person_outline),
                        selectedIcon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the tabs section
  Widget _buildTabsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tabs organize content across different screens, data sets, and other interactions.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'Tab 1'),
                        Tab(text: 'Tab 2'),
                        Tab(text: 'Tab 3'),
                      ],
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 150,
                      child: TabBarView(
                        children: [
                          Center(
                            child: Text(
                              'Tab 1 Content',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Tab 2 Content',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Tab 3 Content',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Scrollable Tabs:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DefaultTabController(
                length: 5,
                child: Column(
                  children: [
                    const TabBar(
                      isScrollable: true,
                      tabs: [
                        Tab(text: 'Tab 1'),
                        Tab(text: 'Tab 2'),
                        Tab(text: 'Tab 3'),
                        Tab(text: 'Tab 4'),
                        Tab(text: 'Tab 5'),
                      ],
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 100,
                      child: TabBarView(
                        children: [
                          Center(child: Text('Content 1')),
                          Center(child: Text('Content 2')),
                          Center(child: Text('Content 3')),
                          Center(child: Text('Content 4')),
                          Center(child: Text('Content 5')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the drawer section
  Widget _buildDrawerSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Navigation drawers provide access to destinations in your app.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  title: const Text('Drawer Example'),
                  leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Text(
                          'Drawer Header',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text('Home'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Settings'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text('Help'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                body: const Center(
                  child: Text(
                    'Press the menu icon to open the drawer',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: const Text('Open Drawer'),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the app bar navigation section
  Widget _buildAppBarNavigationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App bars provide content and actions related to the current screen.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  AppBar(
                    title: const Text('Standard AppBar'),
                    leading: const BackButton(),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                    child: Center(
                      child: Text('Screen Content'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'SliverAppBar (Collapsing):',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    pinned: true,
                    expandedHeight: 120.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Collapsing AppBar'),
                      background: ColoredBox(color: Colors.blue),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ListTile(
                          title: Text('Item ${index + 1}'),
                        );
                      },
                      childCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
