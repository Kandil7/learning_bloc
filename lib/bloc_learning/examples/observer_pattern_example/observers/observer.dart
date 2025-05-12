/// Observer Interface
/// 
/// This interface defines the contract for all observers.
/// Any class that wants to observe a subject must implement this interface.
abstract class Observer<T> {
  /// Called by the subject when its state changes
  void update(T data);
}
