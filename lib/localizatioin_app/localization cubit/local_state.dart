
import 'package:flutter/material.dart';

@immutable
abstract class LocalState {}

class LocalInitial extends LocalState {}

class LocalChanged extends LocalState{
  final String local;
  LocalChanged({required this.local});
}