import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/models/product.dart';

/// Events for the CartBloc
///
/// These events represent cart-related actions.
sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the cart
class LoadCart extends CartEvent {}

/// Event to add a product to the cart
class AddToCart extends CartEvent {
  final Product product;
  final int quantity;

  const AddToCart(this.product, {this.quantity = 1});

  @override
  List<Object?> get props => [product, quantity];
}

/// Event to remove a product from the cart
class RemoveFromCart extends CartEvent {
  final int productId;

  const RemoveFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

/// Event to update the quantity of a product in the cart
class UpdateCartItemQuantity extends CartEvent {
  final int productId;
  final int quantity;

  const UpdateCartItemQuantity(this.productId, this.quantity);

  @override
  List<Object?> get props => [productId, quantity];
}

/// Event to clear the cart
class ClearCart extends CartEvent {}
