import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_event.dart';
import 'counter_state.dart';



class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if(event is CounterIncrement){
        counter++;
        emit(CounterChangedValue(counter: counter));
      }
      else if(event is CounterDecrement){
        counter--;
        emit(CounterChangedValue(counter: counter));
      }
      else if(event is CounterReset){
        counter = 0;
        emit(CounterChangedValue(counter: counter));
      }

    });
  }
}
