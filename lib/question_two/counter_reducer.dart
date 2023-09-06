import 'package:littlefish/question_two/counter_actions.dart';
import 'package:littlefish/question_two/counter_app_state.dart';

CounterAppState reducer(CounterAppState prevState, dynamic action) {
  if (action == Actions.increment) {
    return CounterAppState(prevState.value + 1);
  } else if (action == Actions.decrement) {
    return CounterAppState(prevState.value - 1);
  } else {
    return prevState;
  }
}
