import 'package:flutter/material.dart';

class ErrorPostLoading extends StatelessWidget {
  final String errorMessege;
  const ErrorPostLoading({super.key, required this.errorMessege});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessege));
  }
}
