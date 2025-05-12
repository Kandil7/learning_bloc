import 'dart:math';

// Model
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

// Repository
class UserRepository {
  // Simulate network delay
  Future<List<User>> getUsers() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulate random failure (20% chance)
    if (Random().nextInt(5) == 0) {
      throw Exception('Failed to load users');
    }
    
    // Return mock data
    return [
      User(id: 1, name: 'John Doe', email: 'john@example.com'),
      User(id: 2, name: 'Jane Smith', email: 'jane@example.com'),
      User(id: 3, name: 'Bob Johnson', email: 'bob@example.com'),
      User(id: 4, name: 'Alice Brown', email: 'alice@example.com'),
      User(id: 5, name: 'Charlie Davis', email: 'charlie@example.com'),
    ];
  }
}