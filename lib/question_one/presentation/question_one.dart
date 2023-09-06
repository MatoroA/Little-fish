import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:littlefish/core/question_app_bar.dart';
import 'package:littlefish/question_one/view_model/counter_bloc.dart';
import 'package:littlefish/question_one/view_model/counter_events.dart';
import 'package:littlefish/question_one/view_model/counter_state.dart';

class QuestionOne extends StatelessWidget {
  const QuestionOne({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _QuestionOneUI(),
    );
  }
}

class _QuestionOneUI extends StatefulWidget {
  const _QuestionOneUI();

  @override
  State<_QuestionOneUI> createState() => _QuestionOneUIState();
}

class _QuestionOneUIState extends State<_QuestionOneUI> {
  late CounterBloc viewModel;

  @override
  void initState() {
    viewModel = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuestionAppBar(pageTitle: 'Question One'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (_, counterState) {
              return Text('Counter: ${counterState.value}');
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  viewModel.add(Increment());
                },
                child: const Text('+'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  viewModel.add(Decrement());
                },
                child: const Text('-'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
