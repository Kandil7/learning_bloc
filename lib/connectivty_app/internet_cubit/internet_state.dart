
import 'package:flutter/material.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetChanged extends InternetState{
  final bool internetState;
  InternetChanged({required this.internetState});
}

class CheckConnectedState extends InternetState{}
