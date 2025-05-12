import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class TimerEvent {}

class TimerStarted extends TimerEvent {
  final int duration;
  TimerStarted(this.duration);
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;
  TimerTicked(this.duration);
}

// States
abstract class TimerState {
  final int duration;
  const TimerState(this.duration);
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}

// Ticker - A class that provides a stream of ticks
class Ticker {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}

// BLoC
class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 60;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete(),
    );
  }
}

class StreamExampleScreen extends StatelessWidget {
  const StreamExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: Ticker()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stream Example with BLoC'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExplanation(),
              const SizedBox(height: 24),
              _buildTimerDisplay(),
              const SizedBox(height: 24),
              _buildControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Streams with BLoC Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates how to work with streams in BLoC:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Ticker class provides a stream of ticks', style: TextStyle(fontSize: 14)),
          Text('• TimerBloc subscribes to the stream and processes events', style: TextStyle(fontSize: 14)),
          Text('• BLoC manages stream subscription lifecycle', style: TextStyle(fontSize: 14)),
          Text('• UI reacts to state changes from the stream', style: TextStyle(fontSize: 14)),
          Text('• Demonstrates proper stream resource management', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildTimerDisplay() {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: _getBackgroundColor(state),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${state.duration}',
                    style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                _getStateText(state),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildControls() {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state is TimerInitial) ...[  
              _buildButton(
                onPressed: () => context.read<TimerBloc>().add(TimerStarted(state.duration)),
                icon: Icons.play_arrow,
                color: Colors.green,
              ),
            ],
            if (state is TimerRunInProgress) ...[  
              _buildButton(
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
                icon: Icons.pause,
                color: Colors.orange,
              ),
              const SizedBox(width: 16),
              _buildButton(
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                icon: Icons.replay,
                color: Colors.red,
              ),
            ],
            if (state is TimerRunPause) ...[  
              _buildButton(
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
                icon: Icons.play_arrow,
                color: Colors.green,
              ),
              const SizedBox(width: 16),
              _buildButton(
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                icon: Icons.replay,
                color: Colors.red,
              ),
            ],
            if (state is TimerRunComplete) ...[  
              _buildButton(
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
                icon: Icons.replay,
                color: Colors.blue,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
      ),
      child: Icon(icon, size: 36, color: Colors.white),
    );
  }

  Color _getBackgroundColor(TimerState state) {
    if (state is TimerInitial) return Colors.blue[100]!;
    if (state is TimerRunInProgress) return Colors.green[100]!;
    if (state is TimerRunPause) return Colors.orange[100]!;
    if (state is TimerRunComplete) return Colors.red[100]!;
    return Colors.grey[100]!;
  }

  String _getStateText(TimerState state) {
    if (state is TimerInitial) return 'Ready to Start';
    if (state is TimerRunInProgress) return 'Running';
    if (state is TimerRunPause) return 'Paused';
    if (state is TimerRunComplete) return 'Completed!';
    return '';
  }
}