import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/cart/cart_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/cart/cart_state.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/services/cart_service.dart';

/// BLoC for cart
///
/// This BLoC handles cart-related events and states.
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService cartService;

  /// Constructor for CartBloc
  CartBloc({required this.cartService}) : super(CartState.initial()) {
    // Register event handlers
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<ClearCart>(_onClearCart);
  }

  /// Handle the load cart event
  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    final items = cartService.getCartItems();
    final totalPrice = cartService.getTotalPrice();
    final totalItems = cartService.getTotalItems();

    emit(CartState(
      items: items,
      totalPrice: totalPrice,
      totalItems: totalItems,
    ));
  }

  /// Handle the add to cart event
  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    cartService.addToCart(event.product, quantity: event.quantity);
    
    final items = cartService.getCartItems();
    final totalPrice = cartService.getTotalPrice();
    final totalItems = cartService.getTotalItems();

    emit(CartState(
      items: items,
      totalPrice: totalPrice,
      totalItems: totalItems,
    ));
  }

  /// Handle the remove from cart event
  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    cartService.removeFromCart(event.productId);
    
    final items = cartService.getCartItems();
    final totalPrice = cartService.getTotalPrice();
    final totalItems = cartService.getTotalItems();

    emit(CartState(
      items: items,
      totalPrice: totalPrice,
      totalItems: totalItems,
    ));
  }

  /// Handle the update cart item quantity event
  void _onUpdateCartItemQuantity(
      UpdateCartItemQuantity event, Emitter<CartState> emit) {
    cartService.updateQuantity(event.productId, event.quantity);
    
    final items = cartService.getCartItems();
    final totalPrice = cartService.getTotalPrice();
    final totalItems = cartService.getTotalItems();

    emit(CartState(
      items: items,
      totalPrice: totalPrice,
      totalItems: totalItems,
    ));
  }

  /// Handle the clear cart event
  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    cartService.clearCart();
    
    emit(CartState.initial());
  }
}
