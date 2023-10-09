
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/home.dart';

import 'bloc_observe.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const BlocAppObserver();
   runApp(const MyApp());
}


