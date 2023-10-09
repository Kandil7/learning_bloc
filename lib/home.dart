import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning_bloc/connectivty_app/internet_cubit/internet_cubit.dart';
import 'package:learning_bloc/localizatioin_app/localization%20cubit/local_cubit.dart';
import 'package:learning_bloc/src/home_page.dart';
import 'package:learning_bloc/theme/bloc_theme/theme_bloc.dart';
import 'package:learning_bloc/theme/bloc_theme/theme_event.dart';
import 'package:learning_bloc/theme/bloc_theme/theme_state.dart';
import 'package:learning_bloc/theme/theme_data/theme_data.dart';
import 'package:learning_bloc/theme/theme_servicse/theme_cached.dart';

import 'Counter/Counter_app/counter_bloc/counter_bloc.dart';
import 'Counter/Counter_app/screens/counter_screen.dart';
import 'generated/l10n.dart';
import 'localizatioin_app/cached/cach_helper.dart';
import 'localizatioin_app/localization cubit/local_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

          BlocProvider(create: (context) => CounterBloc()),

          BlocProvider(create: (context) => ThemeBloc()..add(GetThemeEvent())),

          BlocProvider(create: (context) => LocalCubit()..getLocal()),

          BlocProvider(create: (context) => InternetCubit()..checkInternetConnection()),

      ],

      child: BlocConsumer<LocalCubit, LocalState>(
        listener: (context, state) {},
        builder: (context, state) {

            var themeMode =2;
            ThemeCached.getThemeIndexCached().then((value) {
              themeMode = value;
            });
          return MaterialApp(
            locale: Locale(state is LocalChanged ? state.local : 'en'),
            title: 'Localizations Sample App',
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,


            debugShowCheckedModeBanner: false,
            theme: appThemeData[AppTheme.values[themeMode??0]],
            home:  HomePage(),
          );
        },
      ),
    );
  }
}
