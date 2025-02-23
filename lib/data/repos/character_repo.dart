
import '../models/character_model/character_model.dart';
import '../web_services/character_web_services.dart';

class CharacterRepo {
  final CharacterWebServices characterWebServices;

  CharacterRepo(
    this.characterWebServices,
  );

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters.map((character) => CharacterModel.fromJson(character)).toList();
  }
}