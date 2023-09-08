import 'package:equatable/equatable.dart';
import 'package:littlefish/question_three/domain/entities/character.dart';

enum CharactersStatus {
  initial,
  loading,
  failure,
  success,
}

class CharactersState extends Equatable {
  final List<Character> characters;
  final int currentPageKey;
  final bool isLastPage;
  final CharactersStatus status;

  const CharactersState({
    this.characters = const [],
    this.currentPageKey = -1,
    this.isLastPage = false,
    this.status = CharactersStatus.initial,
  });

  CharactersState copyWith({
    List<Character>? characters,
    int? currentPageKey,
    bool? isLastPage,
    CharactersStatus? status,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      currentPageKey: currentPageKey ?? this.currentPageKey,
      isLastPage: isLastPage ?? this.isLastPage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        characters,
        currentPageKey,
        isLastPage,
        status,
      ];
}
