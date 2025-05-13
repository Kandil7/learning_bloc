import 'package:get_it/get_it.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/services/cart_service.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/services/product_service.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/product/product_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/cart/cart_bloc.dart';

/// Service Locator
///
/// This is the service locator for dependency injection.
/// It uses the GetIt package to register and resolve dependencies.
final serviceLocator = GetIt.instance;

/// Initialize the service locator
///
/// This method registers all the dependencies.
void setupServiceLocator() {
  // Register services
  serviceLocator.registerLazySingleton<ProductService>(
    () => ProductServiceImpl(),
  );
  
  serviceLocator.registerLazySingleton<CartService>(
    () => CartServiceImpl(),
  );
  
  // Register BLoCs
  serviceLocator.registerFactory<ProductBloc>(
    () => ProductBloc(productService: serviceLocator()),
  );
  
  serviceLocator.registerFactory<CartBloc>(
    () => CartBloc(cartService: serviceLocator()),
  );
}
