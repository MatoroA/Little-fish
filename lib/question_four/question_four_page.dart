import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:littlefish/core/question_app_bar.dart';
import 'package:littlefish/question_four/internet_connection_cubit.dart';
import 'package:littlefish/question_four/internet_connection_state.dart';

class QuestionFourPage extends StatefulWidget {
  const QuestionFourPage({super.key});

  @override
  State<QuestionFourPage> createState() => _QuestionFourPageState();
}

class _QuestionFourPageState extends State<QuestionFourPage> {
  late InternetConnectionCubit internetConnectionCubit;

  @override
  void initState() {
    internetConnectionCubit = context.read<InternetConnectionCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuestionAppBar(pageTitle: 'Four'),
      body: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
        builder: (_, state) {
          if (state.status == InternetStatus.unKnown) {
            return const Center(child: Text(':/'));
          }

          if (state.status == InternetStatus.connected) {
            return const Center(child: Text('Connected'));
          }

          return const Center(child: Text('Not Connected'));
        },
      ),
    );
  }
}
