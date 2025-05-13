import 'dart:math';

import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/models/product.dart';

/// Product Service
///
/// This service provides methods to fetch and manipulate products.
abstract class ProductService {
  /// Get all products
  Future<List<Product>> getProducts();

  /// Get a product by ID
  Future<Product> getProductById(int id);

  /// Get products by category
  Future<List<Product>> getProductsByCategory(String category);
}

/// Product Service Implementation
///
/// This class implements the ProductService interface.
class ProductServiceImpl implements ProductService {
  // Mock products
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Smartphone',
      description: 'A high-end smartphone with the latest features',
      price: 999.99,
      imageUrl: 'https://example.com/smartphone.jpg',
      stock: 50,
      categories: ['Electronics', 'Phones'],
    ),
    Product(
      id: 2,
      name: 'Laptop',
      description: 'Powerful laptop for work and gaming',
      price: 1499.99,
      imageUrl: 'https://example.com/laptop.jpg',
      stock: 30,
      categories: ['Electronics', 'Computers'],
    ),
    Product(
      id: 3,
      name: 'Headphones',
      description: 'Noise-cancelling wireless headphones',
      price: 299.99,
      imageUrl: 'https://example.com/headphones.jpg',
      stock: 100,
      categories: ['Electronics', 'Audio'],
    ),
    Product(
      id: 4,
      name: 'T-shirt',
      description: 'Comfortable cotton t-shirt',
      price: 19.99,
      imageUrl: 'https://example.com/tshirt.jpg',
      stock: 200,
      categories: ['Clothing', 'Men'],
    ),
    Product(
      id: 5,
      name: 'Jeans',
      description: 'Classic blue jeans',
      price: 49.99,
      imageUrl: 'https://example.com/jeans.jpg',
      stock: 150,
      categories: ['Clothing', 'Men'],
    ),
  ];

  @override
  Future<List<Product>> getProducts() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Simulate random failure (10% chance)
    if (Random().nextDouble() < 0.1) {
      throw Exception('Failed to fetch products');
    }

    return _products;
  }

  @override
  Future<Product> getProductById(int id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Simulate random failure (10% chance)
    if (Random().nextDouble() < 0.1) {
      throw Exception('Failed to fetch product with ID $id');
    }

    // Find the product
    final product = _products.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception('Product not found'),
    );

    return product;
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Simulate random failure (10% chance)
    if (Random().nextDouble() < 0.1) {
      throw Exception('Failed to fetch products by category');
    }

    // Filter products by category
    final products = _products
        .where((product) => product.categories.contains(category))
        .toList();

    return products;
  }
}
