
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/character_model/character_model.dart';
import '../../repos/character_repo.dart';
import 'character_state.dart';


class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepo characterRepo;
  List<CharacterModel> characters = [];

  CharacterCubit({required this.characterRepo}) : super(CharactersInitial());

  void getAllCharacters() async {
    try {
      emit(CharactersLoading());

      characters = await characterRepo.getAllCharacters();
      print("✅ Characters in Cubit: $characters"); // ✅ التأكد من استقبال البيانات

      if (characters.isEmpty) {
        emit(CharactersError("No data available"));
      } else {
        emit(CharactersLoaded(characters));
      }
    } catch (e) {
      print("❌ Error in CharacterCubit: $e");
      emit(CharactersError("Failed to load characters"));
    }
  }
}
