import 'package:flutter/material.dart';

/// A widget showcasing Material Design form components in Flutter
///
/// This widget demonstrates:
/// - TextField
/// - Checkbox
/// - Radio
/// - Switch
/// - Slider
/// - Date & Time Pickers
class MaterialFormShowcase extends StatefulWidget {
  /// Creates a new Material form showcase
  const MaterialFormShowcase({Key? key}) : super(key: key);

  @override
  State<MaterialFormShowcase> createState() => _MaterialFormShowcaseState();
}

class _MaterialFormShowcaseState extends State<MaterialFormShowcase> {
  final _formKey = GlobalKey<FormState>();
  
  // Form values
  String _name = '';
  String _email = '';
  bool _isSubscribed = false;
  String _gender = 'male';
  bool _isActive = true;
  double _age = 25;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Form Components'),
        _buildFormSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Selection Controls'),
        _buildSelectionControlsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Sliders'),
        _buildSlidersSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Date & Time Pickers'),
        _buildDateTimePickersSection(),
      ],
    );
  }

  /// Builds a section title
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  /// Builds the form section
  Widget _buildFormSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TextFields allow users to enter text into an app.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  helperText: 'Password must be at least 8 characters',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form submitted successfully'),
                      ),
                    );
                  }
                },
                child: const Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the selection controls section
  Widget _buildSelectionControlsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selection controls allow users to complete tasks that involve making choices.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Checkbox:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _isSubscribed,
                  onChanged: (value) {
                    setState(() {
                      _isSubscribed = value!;
                    });
                  },
                ),
                const Text('Subscribe to newsletter'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Radio Buttons:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Radio<String>(
                  value: 'male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text('Male'),
                const SizedBox(width: 16),
                Radio<String>(
                  value: 'female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text('Female'),
                const SizedBox(width: 16),
                Radio<String>(
                  value: 'other',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text('Other'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Switch:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Switch(
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
                const Text('Active Status'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the sliders section
  Widget _buildSlidersSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sliders allow users to select from a range of values.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Continuous Slider:'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('0'),
                Expanded(
                  child: Slider(
                    value: _age,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _age = value;
                      });
                    },
                  ),
                ),
                const Text('100'),
              ],
            ),
            Center(
              child: Text(
                'Value: ${_age.toStringAsFixed(1)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Discrete Slider:'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('0'),
                Expanded(
                  child: Slider(
                    value: _age,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: _age.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _age = value;
                      });
                    },
                  ),
                ),
                const Text('100'),
              ],
            ),
            Center(
              child: Text(
                'Value: ${_age.round()}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the date & time pickers section
  Widget _buildDateTimePickersSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date and time pickers allow users to select a date or time.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null && picked != _selectedDate) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      'Date: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: _selectedTime,
                      );
                      if (picked != null && picked != _selectedTime) {
                        setState(() {
                          _selectedTime = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.access_time),
                    label: Text(
                      'Time: ${_selectedTime.format(context)}',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
