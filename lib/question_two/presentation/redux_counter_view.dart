import 'package:flutter/material.dart';
import 'package:littlefish/core/question_app_bar.dart';
import 'package:littlefish/question_two/counter_actions.dart' as redux_actions;
import 'package:littlefish/question_two/counter_app_state.dart';
import 'package:littlefish/question_two/counter_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ReduxCounterView extends StatelessWidget {
  ReduxCounterView({super.key});

  final store = Store<CounterAppState>(
    reducer,
    initialState: CounterAppState(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: const QuestionAppBar(pageTitle: 'Question One'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<CounterAppState, int>(
              converter: (store) => store.state.value,
              builder: (_, counter) => Text('Counter: $counter'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StoreConnector<CounterAppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(
                          redux_actions.Actions.increment,
                        );
                  },
                  builder: (_, callBack) => ElevatedButton(
                    onPressed: callBack,
                    child: const Text('+'),
                  ),
                ),
                const SizedBox(width: 12),
                StoreConnector<CounterAppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(
                          redux_actions.Actions.decrement,
                        );
                  },
                  builder: (_, callBack) => ElevatedButton(
                    onPressed: callBack,
                    child: const Text('-'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
