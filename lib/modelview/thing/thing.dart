
class Thing {
  String name;

  int? id;
  int? idCategorie;
  int? episode;
  int? season;
  int? chapter;
  int? tome;

  Thing({
    required this.name,
    this.idCategorie,
    this.id,
    this.episode,
    this.season,
    this.chapter,
    this.tome,
  });

  Thing.empty() : this(name: '');
  Thing.fromBdd(Map<String, dynamic> map) : this(
    idCategorie: map['idCategorie'],
    name: map['name'],
    id: map['id'],
    episode: map['episode'],
    season: map['season'],
    chapter: map['chapter'],
    tome: map['tome'],
  );

  Map<String, Object?> toMap() {
    return {
      'idCategorie': idCategorie,
      'name': name,
      'id': id,
      'episode': episode,
      'season': season,
      'chapter': chapter,
      'tome': tome,
    };
  }

  @override
  bool operator ==(Object other) {
    return name == (other as Thing).name
        && idCategorie == other.idCategorie
        && episode == other.episode
        && season == other.season
        && chapter == other.chapter
        && tome == other.tome;
  }
}
class Category {
  int? id;
  String name;

  Category({
    required this.name,
    this.id
  });
  Category.empty() : this(name: '');
  Category.fromBdd(Map<String, dynamic> map) : this(
    name: map['name'],
    id: map['id'],
  );

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  bool operator ==(Object other) {
    return name == (other as Category).name;
  }
}