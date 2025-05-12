# Connectivity App

This example demonstrates how to monitor network connectivity in a Flutter application using the Cubit pattern.

## Learning Objectives

- Understand how to monitor network connectivity in Flutter
- Learn how to use the connectivity_plus package
- Implement a Cubit for state management
- Handle different connectivity states in the UI

## Implementation Details

### Cubit Pattern Implementation

The connectivity app uses the Cubit pattern to manage connectivity state:

1. **States**: Defined in `internet_state.dart`
   - `InternetInitial`: Initial state when the connectivity status is unknown
   - `InternetConnected`: State when the device is connected to the internet
   - `InternetDisconnected`: State when the device is disconnected from the internet

2. **Cubit**: Defined in `internet_cubit.dart`
   - Uses the connectivity_plus package to monitor network status
   - Listens to connectivity changes with StreamSubscription
   - Emits new states based on connectivity changes

### UI Components

The UI is separated into reusable components:

1. **ConnectivityPage**: The main page that displays the connectivity status
   - Uses `BlocProvider` to provide the `InternetCubit` to the widget tree
   - Displays an explanation of the example

2. **ConnectivityStatus**: A widget that displays the current connectivity status
   - Uses `BlocBuilder` to rebuild when the connectivity state changes
   - Shows different UI based on the connection status

## Code Structure

```
connectivity_app/
├── presentation/
│   ├── bloc/
│   │   ├── internet_cubit.dart
│   │   └── internet_state.dart
│   ├── pages/
│   │   └── connectivity_page.dart
│   └── widgets/
│       └── connectivity_status.dart
└── README.md
```

## Key Concepts

### Monitoring Connectivity

The app uses the connectivity_plus package to monitor network connectivity:

```dart
final Connectivity _connectivity = Connectivity();
StreamSubscription<ConnectivityResult>? _connectivitySubscription;

// Initialize the connectivity subscription
_connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
```

### Cubit State Management

The app uses a Cubit to manage connectivity state:

```dart
void _updateConnectionStatus(ConnectivityResult result) {
  if (result == ConnectivityResult.none) {
    emit(InternetDisconnected());
  } else {
    emit(InternetConnected(result));
  }
}
```

### Responsive UI

The UI updates based on the connectivity state:

```dart
BlocBuilder<InternetCubit, InternetState>(
  builder: (context, state) {
    if (state is InternetConnected) {
      return _buildConnectedStatus(context, state);
    } else if (state is InternetDisconnected) {
      return _buildDisconnectedStatus(context);
    } else {
      return _buildCheckingStatus(context);
    }
  },
)
```

## Usage

To use this connectivity monitoring approach in your own projects:

1. Add the connectivity_plus package to your pubspec.yaml
2. Create a Cubit to manage connectivity state
3. Listen to connectivity changes with StreamSubscription
4. Update the UI based on connectivity state

## Resources

- [connectivity_plus Package](https://pub.dev/packages/connectivity_plus)
- [flutter_bloc Package](https://pub.dev/packages/flutter_bloc)
- [Cubit Documentation](https://bloclibrary.dev/#/coreconcepts?id=cubit)
