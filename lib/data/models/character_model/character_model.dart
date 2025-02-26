class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "Unknown",
      status: json['status'] ?? "Unknown",
      species: json['species'] ?? "Unknown",
      gender: json['gender'] ?? "Unknown",
      image: json['image'] ?? "",
    );
  }
}
