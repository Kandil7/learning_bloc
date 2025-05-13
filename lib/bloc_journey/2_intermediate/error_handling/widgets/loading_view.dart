import 'package:flutter/material.dart';

/// Loading View Widget
///
/// This widget displays a loading indicator and a message.
class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Loading...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
