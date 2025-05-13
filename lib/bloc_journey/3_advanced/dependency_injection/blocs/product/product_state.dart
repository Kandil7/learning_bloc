import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/models/product.dart';

/// State for the ProductBloc
///
/// These states represent the different states of product data.
sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

/// Initial state
///
/// This is the initial state of the ProductBloc.
class ProductInitial extends ProductState {}

/// Loading state
///
/// This state indicates that product data is being loaded.
class ProductLoading extends ProductState {}

/// Loaded state for multiple products
///
/// This state contains a list of products that have been loaded.
class ProductsLoaded extends ProductState {
  final List<Product> products;
  final String? category;

  const ProductsLoaded(this.products, {this.category});

  @override
  List<Object?> get props => [products, category];
}

/// Loaded state for a single product
///
/// This state contains a single product that has been loaded.
class ProductLoaded extends ProductState {
  final Product product;

  const ProductLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

/// Error state
///
/// This state indicates that an error occurred while loading product data.
class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
