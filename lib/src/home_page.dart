import 'package:flutter/material.dart';
import 'package:learning_bloc/Counter/Counter_app/widgets/counter_body.dart';
import 'package:learning_bloc/Counter/Counter_app/widgets/counter_button.dart';
import 'package:learning_bloc/generated/l10n.dart';
import 'package:learning_bloc/theme/widget/theme_setting.dart';

import '../connectivty_app/widget/connectivity_screen.dart';
import '../generated/l10n.dart';
import '../localizatioin_app/widget/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SettingsPage())),
              icon: const Icon(Icons.language)),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const SettingsTheme())),
              icon:  const Icon(Icons.dark_mode))
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CounterBody(),
              Text(
                S.of(context).hello_msg,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const ConnectivtyScreen()
            ],
          ),
        ),
      ),
      floatingActionButton: const CounterButton(),
    );
  }
}
