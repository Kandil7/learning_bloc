/// Events for the CounterBloc
///
/// Events are the inputs to a BLoC. They are dispatched by the UI to trigger state changes.
/// We use a sealed class to define the base event type and then create subclasses for each event.
sealed class CounterEvent {}

/// Event to increment the counter
///
/// This event is dispatched when the user wants to increment the counter.
class CounterIncrementPressed extends CounterEvent {}

/// Event to decrement the counter
///
/// This event is dispatched when the user wants to decrement the counter.
class CounterDecrementPressed extends CounterEvent {}

/// Event to reset the counter
///
/// This event is dispatched when the user wants to reset the counter to 0.
class CounterResetPressed extends CounterEvent {}
