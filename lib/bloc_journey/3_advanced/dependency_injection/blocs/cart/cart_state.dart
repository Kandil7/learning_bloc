import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/services/cart_service.dart';

/// State for the CartBloc
///
/// This state represents the cart data.
class CartState extends Equatable {
  final List<CartItem> items;
  final double totalPrice;
  final int totalItems;

  /// Constructor for CartState
  const CartState({
    this.items = const [],
    this.totalPrice = 0,
    this.totalItems = 0,
  });

  /// Initial state
  factory CartState.initial() {
    return const CartState();
  }

  /// Create a copy of this state with the given fields replaced
  CartState copyWith({
    List<CartItem>? items,
    double? totalPrice,
    int? totalItems,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
    );
  }

  @override
  List<Object?> get props => [items, totalPrice, totalItems];
}
