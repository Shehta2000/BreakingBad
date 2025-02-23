import '../../core/constants/app_strings.dart';
import 'package:dio/dio.dart';
import '../models/character_model/character_model.dart';

class CharacterWebServices {
  late Dio _dio;
  final String _baseUrl = ApiEndpoints.baseUrl;

  CharacterWebServices() {
    _dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
  }


  Future<List<dynamic>> getAllCharacters({int page = 1}) async {
    final response = await _dio.get(
      '$_baseUrl/character/',
      queryParameters: {'page': page},
    );
    try {
      if (response.statusCode == 200) {
        final jsonData = response.data;
        final characters = jsonData['results']
            .map((character) => CharacterModel.fromJson(character))
            .toList();
        return characters;
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }

  Future<CharacterModel> getCharacter(int id) async {
    final response = await _dio.get('$_baseUrl/character/$id');

    if (response.statusCode == 200) {
      final jsonData = response.data;
      return CharacterModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load character');
    }
  }
}
