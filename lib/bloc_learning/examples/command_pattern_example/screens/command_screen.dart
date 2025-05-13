import 'package:flutter/material.dart';

/// CommandScreen
///
/// This screen demonstrates the Command Pattern by encapsulating requests as objects,
/// allowing for parameterization of clients with different requests, queuing of requests,
/// and supporting undoable operations.
class CommandScreen extends StatefulWidget {
  const CommandScreen({Key? key}) : super(key: key);

  @override
  State<CommandScreen> createState() => _CommandScreenState();
}

// Command interface
abstract class Command {
  void execute();
  void undo();
  String get name;
}

// Receiver class
class Light {
  bool _isOn = false;
  Color _color = Colors.yellow;
  double _brightness = 1.0;
  
  bool get isOn => _isOn;
  Color get color => _color;
  double get brightness => _brightness;
  
  void turnOn() {
    _isOn = true;
  }
  
  void turnOff() {
    _isOn = false;
  }
  
  void setColor(Color color) {
    _color = color;
  }
  
  void setBrightness(double brightness) {
    _brightness = brightness;
  }
}

// Concrete Command implementations
class LightOnCommand implements Command {
  final Light _light;
  
  LightOnCommand(this._light);
  
  @override
  void execute() {
    _light.turnOn();
  }
  
  @override
  void undo() {
    _light.turnOff();
  }
  
  @override
  String get name => 'Turn On';
}

class LightOffCommand implements Command {
  final Light _light;
  
  LightOffCommand(this._light);
  
  @override
  void execute() {
    _light.turnOff();
  }
  
  @override
  void undo() {
    _light.turnOn();
  }
  
  @override
  String get name => 'Turn Off';
}

class LightColorCommand implements Command {
  final Light _light;
  final Color _newColor;
  late Color _previousColor;
  
  LightColorCommand(this._light, this._newColor);
  
  @override
  void execute() {
    _previousColor = _light.color;
    _light.setColor(_newColor);
  }
  
  @override
  void undo() {
    _light.setColor(_previousColor);
  }
  
  @override
  String get name => 'Change Color';
}

class LightBrightnessCommand implements Command {
  final Light _light;
  final double _newBrightness;
  late double _previousBrightness;
  
  LightBrightnessCommand(this._light, this._newBrightness);
  
  @override
  void execute() {
    _previousBrightness = _light.brightness;
    _light.setBrightness(_newBrightness);
  }
  
  @override
  void undo() {
    _light.setBrightness(_previousBrightness);
  }
  
  @override
  String get name => 'Adjust Brightness';
}

// Invoker class
class RemoteControl {
  final List<Command> _history = [];
  
  void executeCommand(Command command) {
    command.execute();
    _history.add(command);
  }
  
  bool canUndo() {
    return _history.isNotEmpty;
  }
  
  void undo() {
    if (_history.isNotEmpty) {
      final command = _history.removeLast();
      command.undo();
    }
  }
  
  List<String> getHistory() {
    return _history.map((cmd) => cmd.name).toList();
  }
}

class _CommandScreenState extends State<CommandScreen> {
  final Light _light = Light();
  final RemoteControl _remote = RemoteControl();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Command Pattern Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildLightControl(),
            const SizedBox(height: 24),
            _buildCommandHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Command Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'The Command Pattern encapsulates a request as an object:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Decouples the object that invokes the operation from the one that knows how to perform it',
              style: TextStyle(fontSize: 14)),
          Text('• Allows you to parameterize clients with different requests',
              style: TextStyle(fontSize: 14)),
          Text('• Supports undoable operations',
              style: TextStyle(fontSize: 14)),
          Text('• Enables queueing of requests and logging of operations',
              style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildLightControl() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Smart Light Control',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _light.isOn 
                      ? _light.color.withOpacity(_light.brightness) 
                      : Colors.grey[300],
                  boxShadow: _light.isOn 
                      ? [
                          BoxShadow(
                            color: _light.color.withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ] 
                      : null,
                ),
                child: Center(
                  child: Icon(
                    Icons.lightbulb,
                    size: 60,
                    color: _light.isOn ? Colors.white : Colors.grey[400],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _remote.executeCommand(LightOnCommand(_light));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('ON'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _remote.executeCommand(LightOffCommand(_light));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('OFF'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Color:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorButton(Colors.yellow),
                _buildColorButton(Colors.blue),
                _buildColorButton(Colors.red),
                _buildColorButton(Colors.green),
                _buildColorButton(Colors.purple),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Brightness:', style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: _light.brightness,
              onChanged: (value) {
                setState(() {
                  _remote.executeCommand(LightBrightnessCommand(_light, value));
                });
              },
              min: 0.1,
              max: 1.0,
              divisions: 9,
              label: '${(_light.brightness * 100).round()}%',
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: _remote.canUndo() 
                    ? () {
                        setState(() {
                          _remote.undo();
                        });
                      } 
                    : null,
                icon: const Icon(Icons.undo),
                label: const Text('Undo Last Command'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _remote.executeCommand(LightColorCommand(_light, color));
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: _light.color == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildCommandHistory() {
    final history = _remote.getHistory();
    
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
          const Text(
            'Command History',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (history.isEmpty)
            const Text('No commands executed yet')
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final commandName = history[history.length - 1 - index];
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.code, size: 20),
                  title: Text(
                    commandName,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                  trailing: Text('#${history.length - index}'),
                );
              },
            ),
        ],
      ),
    );
  }
}