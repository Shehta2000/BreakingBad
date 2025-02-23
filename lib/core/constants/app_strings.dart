class AppStrings {
  static const String charactersScreen = '/';
  static const String characterDetailsScreen = 'character_details';
}

class ApiEndpoints {
  //*baseUrl
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  //* Character Endpoints
  static String getCharacter(int id) => '$baseUrl/character/$id';
  static String getAllCharacters({int page = 1}) => '$baseUrl/character/?page=$page';

  //* Location Endpoints
  static String getLocation(int id) => '$baseUrl/location/$id';
  static String getAllLocations({int page = 1}) => '$baseUrl/location/?page=$page';

  //* Episode Endpoints
  static String getEpisode(int id) => '$baseUrl/episode/$id';
  static String getAllEpisodes({int page = 1}) => '$baseUrl/episode/?page=$page';
}
