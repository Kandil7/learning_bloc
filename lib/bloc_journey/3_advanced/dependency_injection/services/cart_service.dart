import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/models/product.dart';

/// Cart Item
///
/// This class represents an item in the cart.
class CartItem {
  final Product product;
  int quantity;

  /// Constructor for CartItem
  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

/// Cart Service
///
/// This service provides methods to manage the shopping cart.
abstract class CartService {
  /// Get all items in the cart
  List<CartItem> getCartItems();

  /// Add a product to the cart
  void addToCart(Product product, {int quantity = 1});

  /// Remove a product from the cart
  void removeFromCart(int productId);

  /// Update the quantity of a product in the cart
  void updateQuantity(int productId, int quantity);

  /// Clear the cart
  void clearCart();

  /// Get the total price of the cart
  double getTotalPrice();

  /// Get the total number of items in the cart
  int getTotalItems();
}

/// Cart Service Implementation
///
/// This class implements the CartService interface.
class CartServiceImpl implements CartService {
  // Cart items
  final List<CartItem> _cartItems = [];

  @override
  List<CartItem> getCartItems() {
    return List.unmodifiable(_cartItems);
  }

  @override
  void addToCart(Product product, {int quantity = 1}) {
    // Check if the product is already in the cart
    final index = _cartItems.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      // Update the quantity
      _cartItems[index].quantity += quantity;
    } else {
      // Add a new item
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }
  }

  @override
  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
  }

  @override
  void updateQuantity(int productId, int quantity) {
    final index = _cartItems.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      if (quantity <= 0) {
        // Remove the item if quantity is 0 or negative
        _cartItems.removeAt(index);
      } else {
        // Update the quantity
        _cartItems[index].quantity = quantity;
      }
    }
  }

  @override
  void clearCart() {
    _cartItems.clear();
  }

  @override
  double getTotalPrice() {
    return _cartItems.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }

  @override
  int getTotalItems() {
    return _cartItems.fold(
      0,
      (total, item) => total + item.quantity,
    );
  }
}
