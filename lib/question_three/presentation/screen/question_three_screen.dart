import 'package:flutter/material.dart';
import 'package:littlefish/core/question_app_bar.dart';
import 'package:littlefish/question_three/entities/character.dart';
import 'package:littlefish/question_three/presentation/component/character_widget.dart';
import 'package:littlefish/question_three/presentation/screen/characters_controller.dart';

class QuestionThreeScreen extends StatefulWidget {
  const QuestionThreeScreen({super.key});

  @override
  State<QuestionThreeScreen> createState() => _QuestionThreeScreenState();
}

class _QuestionThreeScreenState extends State<QuestionThreeScreen> {
  final _charactersController = CharactersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuestionAppBar(pageTitle: 'Question Three'),
      body: FutureBuilder(
        future: _charactersController.getCharacters(null),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data ?? [];

          return CharacterListView(characters: data);
        },
      ),
    );
  }
}

class CharacterListView extends StatelessWidget {
  final List<Character> characters;

  const CharacterListView({
    super.key,
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (_, int index) {
        return CharacterWidget(character: characters[index]);
      },
    );
  }
}
