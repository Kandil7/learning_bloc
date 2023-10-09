import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import '../bloc_theme/theme_bloc.dart';
import '../bloc_theme/theme_event.dart';
import '../theme_data/theme_data.dart';

class SettingsTheme extends StatelessWidget {
  const SettingsTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          S.of(context).theme_mode,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          return Card(
            color: appThemeData[itemAppTheme]!.primaryColor,
            child: ListTile(
              title: Text(
                itemAppTheme.name,
                style: appThemeData[itemAppTheme]!.textTheme.titleMedium,
              ),
              onTap: () {
                context
                    .read<ThemeBloc>()
                    .add(ThemeChangedEvent(themeData: itemAppTheme));
              },
            ),
          );
        },
      ),
    );
  }
}