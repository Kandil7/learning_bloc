
import 'package:flutter/material.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChangedValue extends CounterState{
  final int counter;
  CounterChangedValue({required this.counter});
}
