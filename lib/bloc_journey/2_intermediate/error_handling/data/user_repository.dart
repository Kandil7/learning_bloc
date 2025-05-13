import 'dart:math';

/// User model
class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}

/// User repository
///
/// This repository provides methods to fetch users.
/// It simulates API calls with random success/failure.
class UserRepository {
  /// Fetch a list of users
  ///
  /// This method simulates an API call with a delay and random success/failure.
  Future<List<User>> getUsers() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Simulate random failure (30% chance)
    if (Random().nextDouble() < 0.3) {
      throw Exception('Failed to fetch users');
    }

    // Return mock data
    return [
      User(id: 1, name: 'John Doe', email: 'john.doe@example.com'),
      User(id: 2, name: 'Jane Smith', email: 'jane.smith@example.com'),
      User(id: 3, name: 'Bob Johnson', email: 'bob.johnson@example.com'),
      User(id: 4, name: 'Alice Brown', email: 'alice.brown@example.com'),
      User(id: 5, name: 'Charlie Davis', email: 'charlie.davis@example.com'),
    ];
  }

  /// Fetch a user by ID
  ///
  /// This method simulates an API call with a delay and random success/failure.
  Future<User> getUserById(int id) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate random failure (20% chance)
    if (Random().nextDouble() < 0.2) {
      throw Exception('Failed to fetch user with ID $id');
    }

    // Return mock data based on ID
    switch (id) {
      case 1:
        return User(id: 1, name: 'John Doe', email: 'john.doe@example.com');
      case 2:
        return User(id: 2, name: 'Jane Smith', email: 'jane.smith@example.com');
      case 3:
        return User(id: 3, name: 'Bob Johnson', email: 'bob.johnson@example.com');
      case 4:
        return User(id: 4, name: 'Alice Brown', email: 'alice.brown@example.com');
      case 5:
        return User(id: 5, name: 'Charlie Davis', email: 'charlie.davis@example.com');
      default:
        throw Exception('User with ID $id not found');
    }
  }
}
