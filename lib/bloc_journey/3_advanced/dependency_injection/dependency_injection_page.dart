import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/di/service_locator.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/pages/shop_page.dart';

/// Dependency Injection Page
///
/// This page demonstrates the use of BLoC with Dependency Injection.
class DependencyInjectionPage extends StatefulWidget {
  const DependencyInjectionPage({Key? key}) : super(key: key);

  @override
  State<DependencyInjectionPage> createState() => _DependencyInjectionPageState();
}

class _DependencyInjectionPageState extends State<DependencyInjectionPage> {
  @override
  void initState() {
    super.initState();
    // Initialize the service locator
    setupServiceLocator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC with Dependency Injection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Explanation text
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This example demonstrates the use of BLoC with Dependency Injection. '
                'The app uses the GetIt package to register and resolve dependencies. '
                'This allows for better testability, maintainability, and separation of concerns.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            
            // Dependency injection diagram
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dependency Injection Flow',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDependencyBox(
                        'Service Locator (GetIt)',
                        'Registers and resolves dependencies',
                        Colors.purple[100]!,
                      ),
                      const Center(
                        child: Icon(Icons.arrow_downward),
                      ),
                      _buildDependencyBox(
                        'Services',
                        'ProductService, CartService',
                        Colors.blue[100]!,
                      ),
                      const Center(
                        child: Icon(Icons.arrow_downward),
                      ),
                      _buildDependencyBox(
                        'BLoCs',
                        'ProductBloc, CartBloc',
                        Colors.green[100]!,
                      ),
                      const Center(
                        child: Icon(Icons.arrow_downward),
                      ),
                      _buildDependencyBox(
                        'UI',
                        'Pages, Widgets',
                        Colors.orange[100]!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Shop app
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shop App Example',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'This is a simple shop app that demonstrates the use of BLoC with Dependency Injection. '
                        'It has a product list and a shopping cart, with BLoCs for each feature.',
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ShopPage(),
                            ),
                          );
                        },
                        child: const Text('Open Shop App'),
                      ),
                    ],
                  ),
                ),
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
                  Text('• Dependency Injection: Inversion of control'),
                  Text('• Service Locator: GetIt for dependency resolution'),
                  Text('• Separation of concerns: Services, BLoCs, UI'),
                  Text('• Testability: Easy to mock dependencies'),
                  SizedBox(height: 16),
                  Text(
                    'Implementation Details:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('1. Service Locator registers services and BLoCs'),
                  Text('2. BLoCs depend on services, not implementations'),
                  Text('3. UI depends on BLoCs, not services'),
                  Text('4. Dependencies are injected via constructors'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build a dependency box
  Widget _buildDependencyBox(String title, String content, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(content),
        ],
      ),
    );
  }
}
