import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/factory_pattern_example/product_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/factory_pattern_example/product_factory.dart';

/// ProductScreen
///
/// This screen demonstrates the Factory Pattern with BLoC by allowing users
/// to create different types of products using a factory.
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedType = 'electronic';

  final List<String> _productTypes = ['electronic', 'clothing', 'food'];

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product Factory with BLoC'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<ProductBloc>().add(ClearProductsEvent());
                },
                tooltip: 'Clear Products',
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductsLoadedState) {
                      return _buildProductList(state.products);
                    } else if (state is ProductErrorState) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return const Center(
                          child: Text('Create your first product below!'));
                    }
                  },
                ),
              ),
              _buildProductForm(context),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProductList(List<Product> products) {
    if (products.isEmpty) {
      return const Center(child: Text('No products yet. Add some below!'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final productType = _getProductType(product);

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: _getProductIcon(productType),
            title: Text(product.getName()),
            subtitle: Text('Type: ${productType.toUpperCase()}'),
            trailing: Text(
              '\$${product.getPrice().toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  String _getProductType(Product product) {
    if (product is ElectronicProduct) {
      return 'electronic';
    } else if (product is ClothingProduct) {
      return 'clothing';
    } else if (product is FoodProduct) {
      return 'food';
    } else {
      return 'unknown';
    }
  }

  Widget _getProductIcon(String type) {
    IconData icon;
    Color color;

    switch (type) {
      case 'electronic':
        icon = Icons.devices;
        color = Colors.blue;
        break;
      case 'clothing':
        icon = Icons.checkroom;
        color = Colors.purple;
        break;
      case 'food':
        icon = Icons.fastfood;
        color = Colors.orange;
        break;
      default:
        icon = Icons.category;
        color = Colors.grey;
    }

    return CircleAvatar(
      backgroundColor: color.withOpacity(0.2),
      child: Icon(icon, color: color),
    );
  }

  Widget _buildProductForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create New Product',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Product Type',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.category),
              ),
              value: _selectedType,
              items: _productTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.label),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product name';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final name = _nameController.text;
                  final price = double.parse(_priceController.text);

                  context.read<ProductBloc>().add(
                        CreateProductEvent(
                          type: _selectedType,
                          name: name,
                          price: price,
                        ),
                      );

                  // Clear form
                  _nameController.clear();
                  _priceController.clear();
                  FocusScope.of(context).unfocus();
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('CREATE PRODUCT'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}