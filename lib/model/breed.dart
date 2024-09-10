// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cat_app_technical_test/model/cat_image.dart';
import 'package:cat_app_technical_test/model/weight.dart';

class Breed {
  final Weight weight;
  final String id;
  final String name;
  final String? temperament;
  final int? affectionLevel;
  final String origin;
  final String? altNames;
  final String description;
  final int intelligence;
  final int adaptability;
  final String? lifeSpan;
  final CatImage image;

  Breed({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.affectionLevel,
    required this.origin,
    required this.altNames,
    required this.description,
    required this.intelligence,
    required this.adaptability,
    required this.lifeSpan,
    required this.image,
  });

  factory Breed.fromRawJson(String str) => Breed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Breed copyWith({
    Weight? weight,
    String? id,
    String? name,
    String? temperament,
    int? affectionLevel,
    String? origin,
    String? altNames,
    String? description,
    int? intelligence,
    int? adaptability,
    String? lifeSpan,
    CatImage? image,
  }) {
    return Breed(
      weight: weight ?? this.weight,
      id: id ?? this.id,
      name: name ?? this.name,
      temperament: temperament ?? this.temperament,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      origin: origin ?? this.origin,
      altNames: altNames ?? this.altNames,
      description: description ?? this.description,
      intelligence: intelligence ?? this.intelligence,
      adaptability: adaptability ?? this.adaptability,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight.toMap(),
      'id': id,
      'name': name,
      'temperament': temperament,
      'affection_level': affectionLevel,
      'origin': origin,
      'alt_names': altNames,
      'description': description,
      'intelligence': intelligence,
      'adaptability': adaptability,
      'life_span': lifeSpan,
      'image': image.toMap(),
    };
  }

  factory Breed.fromMap(Map<String, dynamic> map) {
    return Breed(
      weight: Weight.fromMap(map['weight']??{}),
      id: map['id'] as String,
      name: map['name'] as String,
      temperament: map['temperament'] != null ? map['temperament'] as String : null,
      affectionLevel: map['affection_level'] != null ? map['affection_level'] as int : null,
      origin: map['origin'] as String,
      altNames: map['alt_names'] != null ? map['alt_names'] as String : null,
      description: map['description'] as String,
      intelligence: map['intelligence'] as int,
      adaptability: map['adaptability'] as int,
      lifeSpan: map['life_span'] != null ? map['life_span'] as String : null,
      image: CatImage.fromMap(map['image']??{}),
    );
  }

  String toJson() => json.encode(toMap());

  factory Breed.fromJson(String source) =>
      Breed.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Breed(weight: $weight, id: $id, name: $name, temperament: $temperament, affectionLevel: $affectionLevel, origin: $origin, altNames: $altNames, description: $description, intelligence: $intelligence, adaptability: $adaptability, lifeSpan: $lifeSpan, image: $image)';
  }

  @override
  bool operator ==(covariant Breed other) {
    if (identical(this, other)) return true;

    return other.weight == weight &&
        other.id == id &&
        other.name == name &&
        other.temperament == temperament &&
        other.affectionLevel == affectionLevel &&
        other.origin == origin &&
        other.altNames == altNames &&
        other.description == description &&
        other.intelligence == intelligence &&
        other.adaptability == adaptability &&
        other.lifeSpan == lifeSpan &&
        other.image == image;
  }

  @override
  int get hashCode {
    return weight.hashCode ^
        id.hashCode ^
        name.hashCode ^
        temperament.hashCode ^
        affectionLevel.hashCode ^
        origin.hashCode ^
        altNames.hashCode ^
        description.hashCode ^
        intelligence.hashCode ^
        adaptability.hashCode ^
        lifeSpan.hashCode ^
        image.hashCode;
  }
}
