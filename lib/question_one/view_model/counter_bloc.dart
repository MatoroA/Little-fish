import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:littlefish/question_one/view_model/counter_events.dart';
import 'package:littlefish/question_one/view_model/counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<Increment>((event, emit) {
      emit(state.copyWith(state.value + 1));
    });
    on<Decrement>((event, emit) {
      emit(state.copyWith(state.value - 1));
    });
  }
}
