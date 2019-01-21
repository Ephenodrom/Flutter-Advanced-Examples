// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map<String, dynamic> json) {
  return Planet(
      name: json['name'] as String, distance: json['distance'] as String);
}

Map<String, dynamic> _$PlanetToJson(Planet instance) =>
    <String, dynamic>{'name': instance.name, 'distance': instance.distance};
