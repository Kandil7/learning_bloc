// Observer Pattern Example

/// DataObserver
///
/// Interface for objects that want to observe data changes.
abstract class DataObserver {
  void update(String data);
}

/// DataSubject
///
/// Interface for observable objects that can be watched by observers.
abstract class DataSubject {
  void registerObserver(DataObserver observer);
  void removeObserver(DataObserver observer);
  void notifyObservers();
}

/// ConcreteDataSubject
///
/// A concrete implementation of the DataSubject that maintains a list of observers
/// and notifies them when its state changes.
class ConcreteDataSubject implements DataSubject {
  final List<DataObserver> _observers = [];
  String _data = "";

  // Getter for the current data
  String get data => _data;

  // Setter for the data that also notifies observers
  set data(String newData) {
    _data = newData;
    notifyObservers();
  }

  @override
  void registerObserver(DataObserver observer) {
    if (!_observers.contains(observer)) {
      _observers.add(observer);
    }
  }

  @override
  void removeObserver(DataObserver observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_data);
    }
  }

  // Method to simulate data change
  void changeData(String newData) {
    print("Subject: Changing data to $newData");
    data = newData;
  }
}

/// TextObserver
///
/// A concrete observer that receives text updates.
class TextObserver implements DataObserver {
  final String name;
  String _lastData = "";

  TextObserver(this.name);

  String get lastData => _lastData;

  @override
  void update(String data) {
    _lastData = data;
    print("$name received update: $data");
  }
}

/// CountObserver
///
/// A concrete observer that counts characters in the data.
class CountObserver implements DataObserver {
  final String name;
  int _count = 0;

  CountObserver(this.name);

  int get count => _count;

  @override
  void update(String data) {
    _count = data.length;
    print("$name received update: Character count is $_count");
  }
}

/// UppercaseObserver
///
/// A concrete observer that converts data to uppercase.
class UppercaseObserver implements DataObserver {
  final String name;
  String _uppercaseData = "";

  UppercaseObserver(this.name);

  String get uppercaseData => _uppercaseData;

  @override
  void update(String data) {
    _uppercaseData = data.toUpperCase();
    print("$name received update: Uppercase is $_uppercaseData");
  }
}