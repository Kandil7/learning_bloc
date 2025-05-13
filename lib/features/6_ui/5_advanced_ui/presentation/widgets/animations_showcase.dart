import 'package:flutter/material.dart';

/// A widget that showcases various animation techniques in Flutter
///
/// This widget demonstrates:
/// - Implicit animations
/// - Explicit animations with AnimationController
/// - Hero animations
/// - Staggered animations
class AnimationsShowcase extends StatefulWidget {
  /// Creates a new animations showcase
  const AnimationsShowcase({Key? key}) : super(key: key);

  @override
  State<AnimationsShowcase> createState() => _AnimationsShowcaseState();
}

class _AnimationsShowcaseState extends State<AnimationsShowcase> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  double _opacity = 1.0;
  Color _color = Colors.blue;
  double _borderRadius = 8.0;
  
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;
  late final Animation<double> _rotationAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    // Create animations
    _sizeAnimation = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
    ));
    
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // 360 degrees in radians
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));
    
    // Add listener to rebuild the widget when animation value changes
    _controller.addListener(() {
      setState(() {});
    });
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Animation Techniques',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // Implicit Animations
          _buildSectionTitle('Implicit Animations'),
          const Text('Tap to animate:'),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
                _opacity = _opacity == 1.0 ? 0.5 : 1.0;
                _color = _color == Colors.blue ? Colors.red : Colors.blue;
                _borderRadius = _borderRadius == 8.0 ? 50.0 : 8.0;
              });
            },
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _isExpanded ? 200 : 100,
                height: _isExpanded ? 100 : 100,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                child: Center(
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(milliseconds: 500),
                    child: const Text(
                      'Tap Me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Explicit Animations
          _buildSectionTitle('Explicit Animations'),
          const Text('Tap to play animation:'),
          const SizedBox(height: 8),
          Center(
            child: GestureDetector(
              onTap: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Tap Me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Hero Animation
          _buildSectionTitle('Hero Animation'),
          const Text('Tap the image to see hero animation:'),
          const SizedBox(height: 8),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _HeroDetailScreen(),
                  ),
                );
              },
              child: Hero(
                tag: 'hero-animation-demo',
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.flutter_dash, color: Colors.white, size: 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// A detail screen for the hero animation demo
class _HeroDetailScreen extends StatelessWidget {
  const _HeroDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'hero-animation-demo',
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.flutter_dash, color: Colors.white, size: 150),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Hero animations create a visual connection between screens',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}