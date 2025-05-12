
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning_bloc/bloc_learning/bloc_learning_dashboard.dart';
import 'package:learning_bloc/connectivty_app/internet_cubit/internet_cubit.dart';
import 'package:learning_bloc/post_app/post_bloc/post_bloc.dart';
import 'package:learning_bloc/post_app/post_bloc/post_event.dart';
import 'package:learning_bloc/todo_app/api/todo_api.dart';
import 'package:learning_bloc/todo_app/bloc/todos_bloc.dart';
import 'package:learning_bloc/todo_app/bloc/todos_event.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PostBloc()..add(GetAllPostsEvent()),),
        // BlocProvider(create: (context) => CounterBloc()),
        //
        // BlocProvider(create: (context) => ThemeBloc()..add(GetThemeEvent())),
        BlocProvider(
            create: (context) =>
                TodosBloc(todosApi: TodosApi())..add(GetAllTodosEvent())),
        //
        //     BlocProvider(create: (context) => LocalCubit()..getLocal()),
        //
        BlocProvider(
            create: (context) => InternetCubit()..checkInternetConnection()),
      ],
      child:
             MaterialApp(
              //locale: Locale(state is LocalChanged ? state.local : 'en'),
              locale: const Locale('en'),
              title: 'Localizations Sample App',
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,


              debugShowCheckedModeBanner: false,

              home: const BlocLearningDashboard(),
            ),




    );
  }
}
