import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:littlefish/core/question_app_bar.dart';
import 'package:littlefish/question_three/domain/entities/character.dart';
import 'package:littlefish/question_three/presentation/component/character_widget.dart';
import 'package:littlefish/question_three/presentation/screen/character_full_screen_modal.dart';
import 'package:littlefish/question_three/presentation/screen/view_model/characters_cubit.dart';
import 'package:littlefish/question_three/presentation/screen/view_model/characters_state.dart';

class QuestionThreeScreen extends StatefulWidget {
  const QuestionThreeScreen({super.key});

  @override
  State<QuestionThreeScreen> createState() => _QuestionThreeScreenState();
}

class _QuestionThreeScreenState extends State<QuestionThreeScreen> {
  late CharactersCubit charactersCubit;

  @override
  void initState() {
    charactersCubit = context.read<CharactersCubit>()..getCharacters(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuestionAppBar(pageTitle: 'Question Three'),
      body: BlocConsumer<CharactersCubit, CharactersState>(
        // listenWhen:,
        listener: (_, state) {
          if (state.characters.length < 20) {
          } else {}
        },
        builder: (_, state) {
          if (state.status == CharactersStatus.initial ||
              state.status == CharactersStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == CharactersStatus.failure) {
            return Center(child: Text('Failure'));
          }

          return CharacterListView(
            characters: state.characters,
            isLastPage: state.isLastPage,
            fetchMore: () {
              charactersCubit.getCharacters(state.currentPageKey + 1);
            },
          );
        },
      ),
    );
  }
}

class CharacterListView extends StatelessWidget {
  final List<Character> characters;
  final bool isLastPage;
  final VoidCallback fetchMore;

  const CharacterListView({
    super.key,
    required this.characters,
    required this.isLastPage,
    required this.fetchMore,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels + 250 >
            scrollNotification.metrics.maxScrollExtent) {
          if (!isLastPage) {
            fetchMore();
          }
        }
        return false;
      },
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (_, int index) {
          return CharacterWidget(
            character: characters[index],
            onClick: () async {
              await showCharacterDialog(context);
            },
          );
        },
      ),
    );
  }
}
