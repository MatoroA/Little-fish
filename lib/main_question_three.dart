import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:littlefish/question_three/presentation/screen/question_three_screen.dart';
import 'package:littlefish/question_three/presentation/screen/view_model/characters_cubit.dart';
import 'package:littlefish/question_three/domain/repositories/character_repository.dart';
import 'package:littlefish/question_three/service_locator.dart';
import 'question_three/service_locator.dart' as service_locator;

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await service_locator.registerServices();
    runApp(const MyApp());
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => CharactersCubit(
          serviceLocator.get<CharacterRepository>(),
        ),
        child: const QuestionThreeScreen(),
      ),
    );
  }
}
