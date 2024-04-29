// To parse this JSON data, do
//
//     final anime = animeFromJson(jsonString);

import 'dart:convert';

List<Anime> animeFromJson(String str) => List<Anime>.from(json.decode(str).map((x) => Anime.fromJson(x)));

String animeToJson(List<Anime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Anime {
    String model;
    int pk;
    Fields fields;

    Anime({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int episodes;
    String synopsis;
    double rating;
    String studio;
    String genre;
    DateTime releaseDate;

    Fields({
        required this.user,
        required this.name,
        required this.episodes,
        required this.synopsis,
        required this.rating,
        required this.studio,
        required this.genre,
        required this.releaseDate,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        episodes: json["episodes"],
        synopsis: json["synopsis"],
        rating: json["rating"]?.toDouble(),
        studio: json["studio"],
        genre: json["genre"],
        releaseDate: DateTime.parse(json["release_date"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "episodes": episodes,
        "synopsis": synopsis,
        "rating": rating,
        "studio": studio,
        "genre": genre,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    };
}
