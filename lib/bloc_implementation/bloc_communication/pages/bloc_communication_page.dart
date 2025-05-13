import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter/counter_cubit.dart';
import '../blocs/theme/theme_cubit.dart';
import '../blocs/theme/theme_state.dart';
import '../blocs/color/color_cubit.dart';
import '../blocs/color/color_state.dart';

/// BLoC Communication Page
///
/// This page demonstrates BLoC-to-BLoC communication.
class BlocCommunicationPage extends StatelessWidget {
  /// Route name for navigation
  static const routeName = '/bloc-communication';

  /// Creates a new BlocCommunicationPage instance
  const BlocCommunicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(
          create: (context) => ColorCubit(
            counterCubit: context.read<CounterCubit>(),
          ),
        ),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            themeMode: themeState.themeMode,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            home: const BlocCommunicationView(),
          );
        },
      ),
    );
  }
}

/// BLoC Communication View
///
/// This widget displays the UI for the BLoC communication example.
class BlocCommunicationView extends StatelessWidget {
  /// Creates a new BlocCommunicationView instance
  const BlocCommunicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Communication'),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              context.watch<ThemeCubit>().state.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BLoC-to-BLoC Communication',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This example demonstrates how BLoCs can communicate with each other.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'The ColorCubit listens to the CounterCubit and changes color based on the counter value.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            // Counter value with color from ColorCubit
            BlocBuilder<ColorCubit, ColorState>(
              builder: (context, colorState) {
                return BlocBuilder<CounterCubit, int>(
                  builder: (context, count) {
                    return Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.bold,
                        color: colorState.color,
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 32),
            // Counter buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 48),
            // Explanation
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Key Concepts:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('• MultiBlocProvider: Provides multiple BLoCs to the widget tree'),
                  Text('• BLoC-to-BLoC Communication: One BLoC listens to another'),
                  Text('• StreamSubscription: Used to listen to BLoC state changes'),
                  SizedBox(height: 16),
                  Text(
                    'Implementation:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('class ColorCubit extends Cubit<ColorState> {'),
                  Text('  final CounterCubit _counterCubit;'),
                  Text('  late final StreamSubscription<int> _counterSubscription;'),
                  Text(''),
                  Text('  ColorCubit({required CounterCubit counterCubit})'),
                  Text('      : _counterCubit = counterCubit,'),
                  Text('        super(const ColorState(color: Colors.blue)) {'),
                  Text('    _counterSubscription = _counterCubit.stream.listen(_onCounterChanged);'),
                  Text('  }'),
                  Text(''),
                  Text('  void _onCounterChanged(int count) {'),
                  Text('    if (count.isEven) {'),
                  Text('      emit(const ColorState(color: Colors.blue));'),
                  Text('    } else {'),
                  Text('      emit(const ColorState(color: Colors.red));'),
                  Text('    }'),
                  Text('  }'),
                  Text('}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
