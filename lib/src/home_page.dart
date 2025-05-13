import 'package:flutter/material.dart';
import 'package:flutter_mastery/features/1_fundamentals/counter_app/presentation/widgets/counter_display.dart';
import 'package:flutter_mastery/features/1_fundamentals/counter_app/presentation/widgets/counter_buttons.dart';
import 'package:flutter_mastery/generated/l10n.dart';
import 'package:flutter_mastery/theme/widget/theme_setting.dart';

// Removed connectivity import as it's not found
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
              icon: const Icon(Icons.dark_mode))
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CounterDisplay(),
              Text(
                S.of(context).hello_msg,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              // Removed ConnectivityScreen as it's not found
            ],
          ),
        ),
      ),
      floatingActionButton: const CounterButtons(),
    );
  }
}
