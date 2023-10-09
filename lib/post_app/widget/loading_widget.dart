import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPosts extends StatelessWidget {
  const LoadingPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LoadingAnimationWidget.prograssiveDots(
        color: Colors.blue,
        size: 50,
      ),
    );
  }
}
