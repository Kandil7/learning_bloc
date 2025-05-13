import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/counter/counter_cubit.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/theme/theme_cubit.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/theme/theme_state.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/widgets/efficient_counter.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/widgets/inefficient_counter.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/widgets/theme_switcher.dart';

/// Performance Page
///
/// This page demonstrates performance optimization techniques for BLoC.
class PerformancePage extends StatelessWidget {
  const PerformancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const PerformanceView(),
          );
        },
      ),
    );
  }
}

/// Performance View
///
/// This widget contains the UI for the performance optimization example.
class PerformanceView extends StatefulWidget {
  const PerformanceView({Key? key}) : super(key: key);

  @override
  State<PerformanceView> createState() => _PerformanceViewState();
}

class _PerformanceViewState extends State<PerformanceView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Optimization'),
      ),
      body: Column(
        children: [
          // Explanation text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This example demonstrates performance optimization techniques for BLoC. '
              'Compare the inefficient and efficient implementations to see the difference '
              'in rebuild behavior.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          
          // Theme switcher
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: ThemeSwitcher(),
          ),
          
          // Tab selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 0
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    child: const Text('Inefficient'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 1
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    child: const Text('Efficient'),
                  ),
                ),
              ],
            ),
          ),
          
          // Counter widgets
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                InefficientCounter(),
                EfficientCounter(),
              ],
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
                  'Key Optimization Techniques:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('• Granular widgets: Break UI into smaller widgets'),
                Text('• Selective rebuilds: Use buildWhen to control rebuilds'),
                Text('• Proper state management: Only store necessary state'),
                Text('• Memoization: Use Equatable for efficient equality checks'),
                SizedBox(height: 16),
                Text(
                  'Implementation Details:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('1. Inefficient: Entire widget tree rebuilds on state change'),
                Text('2. Efficient: Only affected widgets rebuild'),
                Text('3. buildWhen: Controls when BlocBuilder rebuilds'),
                Text('4. Equatable: Efficient state equality checks'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
