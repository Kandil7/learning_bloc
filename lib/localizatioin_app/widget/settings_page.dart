import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/localizatioin_app/localization%20cubit/local_cubit.dart';

import '../../generated/l10n.dart';
import '../localization cubit/local_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalCubit, LocalState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).settings),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(S.of(context).change_language),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          LocalCubit.get(context).changeLocal('en');
                        },
                        child: Text(S.of(context).english)),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          LocalCubit.get(context).changeLocal('ar');
                        },
                        child: Text(S.of(context).arabic)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
