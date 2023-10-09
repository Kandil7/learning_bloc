import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observe.dart';
import 'home.dart';
import 'localizatioin_app/cached/cach_helper.dart';

 main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const BlocAppObserver();
   runApp(const MyApp());
}


