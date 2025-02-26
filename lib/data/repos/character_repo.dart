
import '../models/character_model/character_model.dart';
import '../web_services/character_web_services.dart';


class CharacterRepo {
  final CharacterWebServices characterWebServices;

  CharacterRepo({required this.characterWebServices});

  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final charactersData = await characterWebServices.fetchCharacters();
      print("✅ Raw Data in Repo: $charactersData"); // ✅ طباعة البيانات للتحقق

      List<CharacterModel> characters = charactersData
          .map((character) => CharacterModel.fromJson(character))
          .toList();

      print("✅ Parsed Characters: $characters"); // ✅ التأكد من التحويل الصحيح
      return characters;
    } catch (e) {
      print("❌ Error in CharacterRepo: $e");
      throw Exception("Failed to load characters");
    }
  }
}
