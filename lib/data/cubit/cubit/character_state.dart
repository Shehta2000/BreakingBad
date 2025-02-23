part of 'character_cubit.dart';

abstract class CharacterState {}

final class CharacterInitial extends CharacterState {}


class CharactersLoaded extends CharacterState {
  final List<CharacterModel> characters;

  CharactersLoaded(this.characters);
}