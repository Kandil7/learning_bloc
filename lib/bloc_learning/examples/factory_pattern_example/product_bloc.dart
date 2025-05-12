import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/product_factory.dart';

// Events
abstract class ProductEvent {}

class CreateProductEvent extends ProductEvent {
  final String type;
  final String name;
  final double price;
  
  CreateProductEvent({required this.type, required this.name, required this.price});
}

class ClearProductsEvent extends ProductEvent {}

// States
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductsLoadedState extends ProductState {
  final List<Product> products;
  
  ProductsLoadedState(this.products);
}

class ProductErrorState extends ProductState {
  final String message;
  
  ProductErrorState(this.message);
}

// BLoC
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final List<Product> _products = [];
  
  ProductBloc() : super(ProductInitialState()) {
    on<CreateProductEvent>(_onCreateProduct);
    on<ClearProductsEvent>(_onClearProducts);
  }

  void _onCreateProduct(CreateProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    
    try {
      // Use the factory to create a product
      final product = ProductFactory.createProduct(
        event.type, 
        event.name, 
        event.price
      );
      
      // Add to our list
      _products.add(product);
      
      // Emit new state with all products
      emit(ProductsLoadedState(List.from(_products)));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  void _onClearProducts(ClearProductsEvent event, Emitter<ProductState> emit) {
    _products.clear();
    emit(ProductsLoadedState([]));
  }
}