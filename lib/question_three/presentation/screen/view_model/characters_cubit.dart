import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:littlefish/question_three/presentation/screen/view_model/characters_state.dart';
import 'package:littlefish/question_three/domain/repositories/character_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository repository;
  final _limit = 20;

  CharactersCubit(this.repository) : super(const CharactersState());

  Future<void> getCharacters(int key) async {
    if (state.status != CharactersStatus.loading) {
      try {
        emit(state.copyWith(currentPageKey: key, status: CharactersStatus.loading));
        final response = await repository.getCharacters(
          limit: _limit,
          page: key,
        );

        emit(
          state.copyWith(
            characters: [...state.characters, ...response],
            status: CharactersStatus.success,
            isLastPage: response.length < _limit,
          ),
        );
      } catch (e) {
        debugPrint('something went wrong!!!');
        emit(state.copyWith(status: CharactersStatus.failure));
      }
    }
  }
}
