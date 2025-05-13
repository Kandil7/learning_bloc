import 'package:flutter/material.dart';

/// BuilderScreen
///
/// This screen demonstrates the Builder Pattern by allowing users
/// to construct complex objects step by step.
class BuilderScreen extends StatefulWidget {
  const BuilderScreen({Key? key}) : super(key: key);

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Product being built
  final Map<String, dynamic> _product = {
    'type': 'Standard',
    'features': <String>[],
    'color': Colors.blue,
    'size': 'Medium',
    'price': 0.0,
  };

  // Available options
  final List<String> _types = ['Standard', 'Premium', 'Deluxe'];
  final List<String> _features = [
    'Water Resistant', 
    'Shock Proof', 
    'Extended Warranty',
    'Fast Charging',
    'Voice Control'
  ];
  final List<String> _sizes = ['Small', 'Medium', 'Large'];
  final List<Color> _colors = [Colors.blue, Colors.red, Colors.green, Colors.purple, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder Pattern Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildForm(),
            const SizedBox(height: 24),
            _buildProductPreview(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Builder Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'The Builder Pattern separates the construction of a complex object from its representation:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Constructs complex objects step by step',
              style: TextStyle(fontSize: 14)),
          Text('• Allows different representations of the same object',
              style: TextStyle(fontSize: 14)),
          Text('• Isolates code for construction and representation',
              style: TextStyle(fontSize: 14)),
          Text('• Provides greater control over the construction process',
              style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Build Your Product:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // Type Selection
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Product Type',
              border: OutlineInputBorder(),
            ),
            value: _product['type'],
            items: _types.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _product['type'] = value;
                // Adjust price based on type
                if (value == 'Standard') _product['price'] = 99.99;
                if (value == 'Premium') _product['price'] = 149.99;
                if (value == 'Deluxe') _product['price'] = 199.99;
              });
            },
          ),
          const SizedBox(height: 16),
          
          // Features Selection
          const Text('Features:', style: TextStyle(fontSize: 16)),
          ...List.generate(_features.length, (index) {
            final feature = _features[index];
            return CheckboxListTile(
              title: Text(feature),
              value: _product['features'].contains(feature),
              onChanged: (selected) {
                setState(() {
                  if (selected == true) {
                    _product['features'].add(feature);
                    _product['price'] += 10.0; // Each feature adds $10
                  } else {
                    _product['features'].remove(feature);
                    _product['price'] -= 10.0;
                  }
                });
              },
            );
          }),
          const SizedBox(height: 16),
          
          // Size Selection
          const Text('Size:', style: TextStyle(fontSize: 16)),
          Row(
            children: _sizes.map((size) {
              return Expanded(
                child: RadioListTile<String>(
                  title: Text(size),
                  value: size,
                  groupValue: _product['size'],
                  onChanged: (value) {
                    setState(() {
                      _product['size'] = value;
                    });
                  },
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          
          // Color Selection
          const Text('Color:', style: TextStyle(fontSize: 16)),
          Wrap(
            spacing: 8,
            children: _colors.map((color) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _product['color'] = color;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _product['color'] == color ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductPreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Preview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: _product['color'],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _product['size'][0],
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_product['type']} Product',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('Size: ${_product['size']}'),
                    const SizedBox(height: 4),
                    if (_product['features'].isNotEmpty) ...[  
                      Text('Features:'),
                      ...(_product['features'] as List<String>).map((feature) => 
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.check, size: 16),
                              SizedBox(width: 4),
                              Text(feature),
                            ],
                          ),
                        )
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      'Price: \$${_product['price'].toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}