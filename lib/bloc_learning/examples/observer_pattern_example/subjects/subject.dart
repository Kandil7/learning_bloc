import 'package:flutter_mastery/bloc_learning/examples/observer_pattern_example/observers/observer.dart';

/// Subject Interface
///
/// This interface defines the contract for all subjects.
/// Any class that wants to be observed must implement this interface.
abstract class Subject<T> {
  /// Attach an observer to this subject
  void attach(Observer<T> observer);

  /// Detach an observer from this subject
  void detach(Observer<T> observer);

  /// Notify all attached observers of a state change
  void notify();
}
