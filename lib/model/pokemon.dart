class Pokemon {
  int id = 0;
  String? name;
  String? spriteUrl;
  bool guessed = false;

  Pokemon.fromJSON(dynamic json) {
    this
      ..id = json['id']
      ..name = json['name']
      ..spriteUrl = json['sprites']['front_default']
      ..guessed = false;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'spriteUrl': spriteUrl,
      'guessed': guessed
    };
  }

  @override
  String toString() {
    return 'id: $id, name: $name, spriteUrl: $spriteUrl';
  }
}
