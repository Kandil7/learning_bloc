

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cached/cach_helper.dart';
import 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  static LocalCubit get(context) => BlocProvider.of(context);

  Future<void> changeLocal(String local) async {

    await LanguageCacheHelper().cacheLanguageCode(local);
    // localCode = local;
    emit(LocalChanged(local: local));
  }
   getLocal() async {
     final localCode = await LanguageCacheHelper().getCachedLanguageCode();
    emit(LocalChanged(local: localCode));
    return localCode;
  }





}

