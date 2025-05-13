import 'package:equatable/equatable.dart';

/// Events for the ProductBloc
///
/// These events represent product-related actions.
sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all products
class LoadProducts extends ProductEvent {}

/// Event to load a product by ID
class LoadProductById extends ProductEvent {
  final int id;

  const LoadProductById(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to load products by category
class LoadProductsByCategory extends ProductEvent {
  final String category;

  const LoadProductsByCategory(this.category);

  @override
  List<Object?> get props => [category];
}
