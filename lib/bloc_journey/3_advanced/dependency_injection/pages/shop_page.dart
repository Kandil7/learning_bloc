import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/cart/cart_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/cart/cart_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/cart/cart_state.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/product/product_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/product/product_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/blocs/product/product_state.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/di/service_locator.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/widgets/cart_widget.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/dependency_injection/widgets/product_list.dart';

/// Shop Page
///
/// This page displays products and the cart.
class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<ProductBloc>()..add(LoadProducts()),
        ),
        BlocProvider(
          create: (context) => serviceLocator<CartBloc>()..add(LoadCart()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
          actions: [
            // Cart icon with badge
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                    ),
                    if (state.totalItems > 0)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${state.totalItems}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            // Products tab
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return switch (state) {
                  ProductInitial() => const Center(
                      child: Text('Loading products...'),
                    ),
                  ProductLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ProductsLoaded() => ProductList(products: state.products),
                  ProductLoaded() => const Center(
                      child: Text('Product details not implemented'),
                    ),
                  ProductError() => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<ProductBloc>().add(LoadProducts());
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                };
              },
            ),
            
            // Cart tab
            const CartWidget(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
