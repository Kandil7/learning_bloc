

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());

  static InternetCubit get(context) => BlocProvider.of(context);

  StreamSubscription? _subscription;


  onConnected() async {
    emit(InternetChanged(internetState: true));
  }

  onDisconnected() async {
    emit(InternetChanged(internetState: false));
  }

  checkInternetConnection()async{
    _subscription=Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {

      if(result==ConnectivityResult.wifi || result==ConnectivityResult.mobile)
        {
          onConnected();
        }
      else{
        onDisconnected();
      }

    });
    emit(CheckConnectedState());

  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

}
