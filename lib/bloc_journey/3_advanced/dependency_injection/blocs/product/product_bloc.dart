import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/product/product_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/product/product_state.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/services/product_service.dart';

/// BLoC for products
///
/// This BLoC handles product-related events and states.
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;

  /// Constructor for ProductBloc
  ProductBloc({required this.productService}) : super(ProductInitial()) {
    // Register event handlers
    on<LoadProducts>(_onLoadProducts);
    on<LoadProductById>(_onLoadProductById);
    on<LoadProductsByCategory>(_onLoadProductsByCategory);
  }

  /// Handle the load products event
  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    try {
      final products = await productService.getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Handle the load product by ID event
  void _onLoadProductById(
      LoadProductById event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    try {
      final product = await productService.getProductById(event.id);
      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Handle the load products by category event
  void _onLoadProductsByCategory(
      LoadProductsByCategory event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    try {
      final products = await productService.getProductsByCategory(event.category);
      emit(ProductsLoaded(products, category: event.category));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
