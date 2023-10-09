import 'package:flutter/material.dart';

class ErrorPostLoading extends StatelessWidget {
  final String errorMessege;
  const ErrorPostLoading({Key? key, required this.errorMessege})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessege),
    );
  }
}
