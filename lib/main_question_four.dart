import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:littlefish/question_four/internet_connection_cubit.dart';
import 'package:littlefish/question_four/question_four_page.dart';

void main() {
  final customInstance = InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1),
    checkInterval: const Duration(seconds: 1),
  );

  runApp(
    MyApp(connectionChecker: customInstance),
  );
}

class MyApp extends StatelessWidget {
  final InternetConnectionChecker connectionChecker;

  const MyApp({
    super.key,
    required this.connectionChecker,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => InternetConnectionCubit(connectionChecker),
        child: const QuestionFourPage(),
      ),
    );
  }
}
