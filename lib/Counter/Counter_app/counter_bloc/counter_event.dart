
import 'package:flutter/material.dart';

@immutable
abstract class CounterEvent {}

class CounterDecrement extends CounterEvent{}

class CounterIncrement extends CounterEvent{}

class CounterReset extends CounterEvent{}
