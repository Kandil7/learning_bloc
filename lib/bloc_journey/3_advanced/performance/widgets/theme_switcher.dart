import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/theme/theme_cubit.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/theme/theme_state.dart';

/// Theme Switcher Widget
///
/// This widget allows the user to switch between light and dark themes.
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ThemeSwitcher build');
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        print('ThemeSwitcher BlocBuilder build');
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Theme:'),
            const SizedBox(width: 16),
            ChoiceChip(
              label: const Text('Light'),
              selected: state.themeMode == ThemeMode.light,
              onSelected: (selected) {
                if (selected) {
                  context.read<ThemeCubit>().setLightTheme();
                }
              },
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Dark'),
              selected: state.themeMode == ThemeMode.dark,
              onSelected: (selected) {
                if (selected) {
                  context.read<ThemeCubit>().setDarkTheme();
                }
              },
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('System'),
              selected: state.themeMode == ThemeMode.system,
              onSelected: (selected) {
                if (selected) {
                  context.read<ThemeCubit>().setSystemTheme();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
