
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ThemeState extends Equatable{
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState{
  final ThemeData themeData;
  const ThemeChanged({required this.themeData});

  @override
  List<Object?> get props => [themeData];
}
