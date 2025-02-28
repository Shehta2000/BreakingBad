import 'package:dio/dio.dart';

class CharacterWebServices {
  final Dio dio;

  CharacterWebServices({required this.dio});

  Future<List<dynamic>> fetchCharacters() async {
    try {
      Response response = await dio.get('https://rickandmortyapi.com/api/character/');

      if (response.statusCode == 200) {
        print("✅ API Response: ${response.data}"); // ✅ طباعة البيانات للتحقق
        return response.data['results']; // 🔥 استخراج البيانات الصحيحة من `results`
      } else {
        print("❌ API Error: ${response.statusCode}");
        throw Exception("Failed to load characters");
      }
    } catch (e) {
      print("❌ Dio Error: $e");
      throw Exception("Failed to load characters");
    }
  }
}
