import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/connectivty_app/internet_cubit/internet_cubit.dart';

import '../../generated/l10n.dart';
import '../internet_cubit/internet_state.dart';

class ConnectivtyScreen extends StatelessWidget {
  const ConnectivtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit,InternetState>(
      listener: (context,state){

      },
      builder: (context,state){
        if(state is InternetChanged) {
          return  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.internetState?
                      S.of(context).internet_connected:
                      S.of(context).internet_disconnected,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10,),

              ],
            ),

        );
        } else {
          return  const Center(
            child: CircularProgressIndicator(),
          );
        }
      },

    );
  }
}
