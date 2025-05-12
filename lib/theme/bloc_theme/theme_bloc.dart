
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/theme/bloc_theme/theme_event.dart';
import 'package:learning_bloc/theme/bloc_theme/theme_state.dart';
import 'package:learning_bloc/theme/theme_servicse/theme_cached.dart';

import '../theme_data/theme_data.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) {
      if(event is GetThemeEvent){
        final theme=ThemeCached.getThemeIndexCached();
        var themeData=AppTheme.values.firstWhere((element) => element.index==theme);
        emit(ThemeChanged(themeData: appThemeData[themeData]!));
      }
      else if(event is ThemeChangedEvent){
        ThemeCached.setThemeIndexCached(event.themeData.index);
        emit(ThemeChanged(themeData: appThemeData[event.themeData]!));
      }
    });
  }
}
