import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/observer_pattern_example/data_source.dart';

/// ObserverScreen
///
/// This screen demonstrates the Observer Pattern by showing how multiple observers
/// can watch and react to changes in a single data source.
class ObserverScreen extends StatefulWidget {
  const ObserverScreen({Key? key}) : super(key: key);

  @override
  State<ObserverScreen> createState() => _ObserverScreenState();
}

class _ObserverScreenState extends State<ObserverScreen> {
  // Create the subject (observable)
  final ConcreteDataSubject _dataSubject = ConcreteDataSubject();
  
  // Create observers
  late final TextObserver _textObserver;
  late final CountObserver _countObserver;
  late final UppercaseObserver _uppercaseObserver;
  
  // Track which observers are active
  bool _isTextObserverActive = true;
  bool _isCountObserverActive = true;
  bool _isUppercaseObserverActive = true;
  
  // Controller for the input field
  final TextEditingController _dataController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    // Initialize observers
    _textObserver = TextObserver('Text Observer');
    _countObserver = CountObserver('Count Observer');
    _uppercaseObserver = UppercaseObserver('Uppercase Observer');
    
    // Register observers with the subject
    _dataSubject.registerObserver(_textObserver);
    _dataSubject.registerObserver(_countObserver);
    _dataSubject.registerObserver(_uppercaseObserver);
    
    // Set initial data
    _dataSubject.data = 'Hello, Observer Pattern!';
    _dataController.text = _dataSubject.data;
  }

  @override
  void dispose() {
    _dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observer Pattern Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildDataInput(),
            const SizedBox(height: 24),
            _buildObserverControls(),
            const SizedBox(height: 24),
            _buildObserverOutputs(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Observer Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates the Observer Pattern:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Subject maintains a list of observers',
              style: TextStyle(fontSize: 14)),
          Text('• Observers register with the subject',
              style: TextStyle(fontSize: 14)),
          Text('• Subject notifies all observers when its state changes',
              style: TextStyle(fontSize: 14)),
          Text('• Observers can be added or removed at runtime',
              style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildDataInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Source (Subject)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dataController,
              decoration: const InputDecoration(
                labelText: 'Enter data',
                border: OutlineInputBorder(),
                helperText: 'Change this text to notify observers',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                final newData = _dataController.text;
                _dataSubject.changeData(newData);
                setState(() {}); // Refresh UI to show updated observer outputs
              },
              icon: const Icon(Icons.send),
              label: const Text('UPDATE DATA'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildObserverControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Observer Controls',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Toggle observers to register/unregister them:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Text Observer'),
              subtitle: const Text('Displays the raw text data'),
              value: _isTextObserverActive,
              onChanged: (value) {
                setState(() {
                  _isTextObserverActive = value;
                  if (value) {
                    _dataSubject.registerObserver(_textObserver);
                  } else {
                    _dataSubject.removeObserver(_textObserver);
                  }
                  // Notify to update the UI
                  _dataSubject.notifyObservers();
                });
              },
            ),
            SwitchListTile(
              title: const Text('Count Observer'),
              subtitle: const Text('Counts the number of characters'),
              value: _isCountObserverActive,
              onChanged: (value) {
                setState(() {
                  _isCountObserverActive = value;
                  if (value) {
                    _dataSubject.registerObserver(_countObserver);
                  } else {
                    _dataSubject.removeObserver(_countObserver);
                  }
                  // Notify to update the UI
                  _dataSubject.notifyObservers();
                });
              },
            ),
            SwitchListTile(
              title: const Text('Uppercase Observer'),
              subtitle: const Text('Converts text to uppercase'),
              value: _isUppercaseObserverActive,
              onChanged: (value) {
                setState(() {
                  _isUppercaseObserverActive = value;
                  if (value) {
                    _dataSubject.registerObserver(_uppercaseObserver);
                  } else {
                    _dataSubject.removeObserver(_uppercaseObserver);
                  }
                  // Notify to update the UI
                  _dataSubject.notifyObservers();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildObserverOutputs() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Observer Outputs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildObserverOutput(
              'Text Observer',
              _isTextObserverActive ? _textObserver.lastData : 'Inactive',
              Colors.blue,
              _isTextObserverActive,
            ),
            const SizedBox(height: 8),
            _buildObserverOutput(
              'Count Observer',
              _isCountObserverActive ? 'Character count: ${_countObserver.count}' : 'Inactive',
              Colors.green,
              _isCountObserverActive,
            ),
            const SizedBox(height: 8),
            _buildObserverOutput(
              'Uppercase Observer',
              _isUppercaseObserverActive ? _uppercaseObserver.uppercaseData : 'Inactive',
              Colors.purple,
              _isUppercaseObserverActive,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildObserverOutput(String title, String output, Color color, bool isActive) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? color.withOpacity(0.1) : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? color : Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? color : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            output,
            style: TextStyle(
              color: isActive ? Colors.black87 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}