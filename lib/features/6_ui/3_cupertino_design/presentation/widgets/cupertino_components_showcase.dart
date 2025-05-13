import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A widget that showcases various Cupertino components
///
/// This widget demonstrates:
/// - CupertinoButton
/// - CupertinoSwitch
/// - CupertinoSlider
/// - CupertinoSegmentedControl
/// - CupertinoContextMenu
/// - CupertinoActionSheet
class CupertinoComponentsShowcase extends StatefulWidget {
  /// Creates a new Cupertino components showcase
  const CupertinoComponentsShowcase({Key? key}) : super(key: key);

  @override
  State<CupertinoComponentsShowcase> createState() => _CupertinoComponentsShowcaseState();
}

class _CupertinoComponentsShowcaseState extends State<CupertinoComponentsShowcase> {
  bool _switchValue = false;
  double _sliderValue = 0.5;
  int _segmentedControlValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cupertino Components',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // CupertinoButton
          const Text('CupertinoButton:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              CupertinoButton(
                padding: const EdgeInsets.all(8),
                onPressed: () {},
                child: const Text('Regular Button'),
              ),
              const SizedBox(width: 16),
              CupertinoButton.filled(
                padding: const EdgeInsets.all(8),
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // CupertinoSwitch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('CupertinoSwitch:', style: TextStyle(fontWeight: FontWeight.bold)),
              CupertinoSwitch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // CupertinoSlider
          const Text('CupertinoSlider:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          CupertinoSlider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          Text('Value: ${(_sliderValue * 100).toStringAsFixed(0)}%'),
          const SizedBox(height: 24),
          
          // CupertinoSegmentedControl
          const Text('CupertinoSegmentedControl:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          CupertinoSegmentedControl<int>(
            children: const {
              0: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Option 1'),
              ),
              1: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Option 2'),
              ),
              2: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Option 3'),
              ),
            },
            onValueChanged: (value) {
              setState(() {
                _segmentedControlValue = value;
              });
            },
            groupValue: _segmentedControlValue,
          ),
          const SizedBox(height: 8),
          Text('Selected: Option ${_segmentedControlValue + 1}'),
          const SizedBox(height: 24),
          
          // CupertinoContextMenu
          const Text('CupertinoContextMenu (long press):', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Center(
            child: CupertinoContextMenu(
              actions: [
                CupertinoContextMenuAction(
                  child: const Text('Action 1'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoContextMenuAction(
                  child: const Text('Action 2'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              child: Container(
                width: 150,
                height: 80,
                color: CupertinoColors.activeBlue,
                child: const Center(
                  child: Text(
                    'Long Press Me',
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // CupertinoActionSheet Button
          Center(
            child: CupertinoButton(
              onPressed: () {
                _showActionSheet(context);
              },
              child: const Text('Show CupertinoActionSheet'),
            ),
          ),
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select an Option'),
        message: const Text('Choose one of the available actions below'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Option 1'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Option 2'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Destructive Option'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ),
    );
  }
}