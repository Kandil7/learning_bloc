import 'package:flutter/material.dart';

/// AdapterScreen
///
/// This screen demonstrates the Adapter Pattern by showing how to adapt
/// incompatible interfaces to work together.
class AdapterScreen extends StatefulWidget {
  const AdapterScreen({Key? key}) : super(key: key);

  @override
  State<AdapterScreen> createState() => _AdapterScreenState();
}

// Target interface that our client code expects
class MediaPlayer {
  void play(String audioType, String fileName) {
    throw UnimplementedError('Subclasses must override');
  }
}

// Adaptee interface that needs adapting
class AdvancedMediaPlayer {
  void playMp4(String fileName) {
    // Implementation for playing mp4 files
  }
  
  void playVlc(String fileName) {
    // Implementation for playing vlc files
  }
}

// Concrete Adaptee implementations
class Mp4Player implements AdvancedMediaPlayer {
  @override
  void playMp4(String fileName) {
    print('Playing mp4 file: $fileName');
  }
  
  @override
  void playVlc(String fileName) {
    // Do nothing
  }
}

class VlcPlayer implements AdvancedMediaPlayer {
  @override
  void playMp4(String fileName) {
    // Do nothing
  }
  
  @override
  void playVlc(String fileName) {
    print('Playing vlc file: $fileName');
  }
}

// Adapter class
class MediaAdapter implements MediaPlayer {
  late AdvancedMediaPlayer _advancedMusicPlayer;
  
  MediaAdapter(String audioType) {
    if (audioType == 'vlc') {
      _advancedMusicPlayer = VlcPlayer();
    } else if (audioType == 'mp4') {
      _advancedMusicPlayer = Mp4Player();
    }
  }
  
  @override
  void play(String audioType, String fileName) {
    if (audioType == 'vlc') {
      _advancedMusicPlayer.playVlc(fileName);
    } else if (audioType == 'mp4') {
      _advancedMusicPlayer.playMp4(fileName);
    }
  }
}

// Concrete implementation of the target interface
class AudioPlayer implements MediaPlayer {
  MediaAdapter? _mediaAdapter;
  
  @override
  void play(String audioType, String fileName) {
    // Built-in support for mp3 format
    if (audioType == 'mp3') {
      print('Playing mp3 file: $fileName');
    } 
    // For other formats, use adapter
    else if (audioType == 'vlc' || audioType == 'mp4') {
      _mediaAdapter = MediaAdapter(audioType);
      _mediaAdapter?.play(audioType, fileName);
    } else {
      print('Invalid media type: $audioType');
    }
  }
}

class _AdapterScreenState extends State<AdapterScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String _selectedFormat = 'mp3';
  final TextEditingController _fileNameController = TextEditingController(text: 'song.mp3');
  String _playbackStatus = '';
  
  final List<String> _formats = ['mp3', 'mp4', 'vlc', 'wav'];
  
  @override
  void dispose() {
    _fileNameController.dispose();
    super.dispose();
  }
  
  void _playMedia() {
    final fileName = _fileNameController.text;
    if (fileName.isEmpty) {
      setState(() {
        _playbackStatus = 'Please enter a file name';
      });
      return;
    }
    
    try {
      _audioPlayer.play(_selectedFormat, fileName);
      setState(() {
        if (_selectedFormat == 'mp3') {
          _playbackStatus = 'Playing mp3 file: $fileName';
        } else if (_selectedFormat == 'mp4') {
          _playbackStatus = 'Playing mp4 file: $fileName';
        } else if (_selectedFormat == 'vlc') {
          _playbackStatus = 'Playing vlc file: $fileName';
        } else {
          _playbackStatus = 'Invalid media type: $_selectedFormat';
        }
      });
    } catch (e) {
      setState(() {
        _playbackStatus = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adapter Pattern Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildMediaPlayer(),
            const SizedBox(height: 24),
            _buildDiagram(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adapter Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'The Adapter Pattern allows incompatible interfaces to work together:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Converts one interface to another that clients expect',
              style: TextStyle(fontSize: 14)),
          Text('• Enables classes to work together that couldn\'t otherwise',
              style: TextStyle(fontSize: 14)),
          Text('• Helps integrate new components with existing code',
              style: TextStyle(fontSize: 14)),
          Text('• Reuses existing functionality without modifying source code',
              style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildMediaPlayer() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Media Player',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _fileNameController,
              decoration: const InputDecoration(
                labelText: 'File Name',
                border: OutlineInputBorder(),
                hintText: 'Enter file name (e.g., song.mp3)',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'File Format',
                border: OutlineInputBorder(),
              ),
              value: _selectedFormat,
              items: _formats.map((format) {
                return DropdownMenuItem(
                  value: format,
                  child: Text(format.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedFormat = value;
                    // Update file extension in the text field
                    final nameWithoutExt = _fileNameController.text.split('.').first;
                    _fileNameController.text = '$nameWithoutExt.$value';
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _playMedia,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Play'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _playbackStatus.isEmpty ? 'No media playing' : _playbackStatus,
                style: TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagram() {
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
            'Pattern Structure',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                _buildDiagramBox('Client\n(AudioPlayer)', Colors.blue[100]!),
                Icon(Icons.arrow_downward),
                _buildDiagramBox('Target Interface\n(MediaPlayer)', Colors.green[100]!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.arrow_downward),
                        _buildDiagramBox('Adapter\n(MediaAdapter)', Colors.orange[100]!),
                        Icon(Icons.arrow_downward),
                      ],
                    ),
                  ],
                ),
                _buildDiagramBox('Adaptee\n(AdvancedMediaPlayer)', Colors.purple[100]!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDiagramBox('Mp4Player', Colors.red[100]!),
                    const SizedBox(width: 16),
                    _buildDiagramBox('VlcPlayer', Colors.red[100]!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiagramBox(String text, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}