import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_first_app/cubit/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));
  bool isListenerInPlay = false;

  void increment() { 
    isListenerInPlay = true;
    emit(CounterState(state.seats + 1));
    
}
  void decrement() {
     isListenerInPlay = true;
    if (state.seats > 0) emit(CounterState(state.seats - 1));
  }

  void resetIsListenerInPlay(){
    isListenerInPlay = false;
  }

  void resetState() => emit(CounterState(0));
}
