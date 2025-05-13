import 'package:equatable/equatable.dart';

/// Product model
///
/// This class represents a product.
class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int stock;
  final List<String> categories;

  /// Constructor for Product
  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stock,
    required this.categories,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        stock,
        categories,
      ];
}
