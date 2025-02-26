
import '../../models/character_model/character_model.dart';

abstract class CharacterState {}

class CharactersInitial extends CharacterState {}

class CharactersLoading extends CharacterState {}

class CharactersLoaded extends CharacterState {
  final List<CharacterModel> characters; // ✅ تأكد أن النوع صحيح

  CharactersLoaded(this.characters);
}

class CharactersError extends CharacterState {
  final String message;
  CharactersError(this.message);
}
