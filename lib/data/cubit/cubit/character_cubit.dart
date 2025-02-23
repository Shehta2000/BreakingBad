// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:breaking_bad/data/models/character_model/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad/data/repos/character_repo.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepo _characterRepo;
  List<CharacterModel> characters = [];

  CharacterCubit(CharacterRepo characterRepo, )
      : _characterRepo = characterRepo,
        super(CharacterInitial());

  List<CharacterModel> getAllCharacters() {
    _characterRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }


}
