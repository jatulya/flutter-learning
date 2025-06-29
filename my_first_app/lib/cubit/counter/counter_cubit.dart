import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/cubit/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void increment() => emit(CounterState(state.seats + 1));

  void decrement() {
    if (state.seats > 0) emit(CounterState(state.seats - 1));
  }

  void reset() => emit(CounterState(0));
}