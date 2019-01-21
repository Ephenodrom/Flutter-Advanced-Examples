import 'package:json_annotation/json_annotation.dart';

part 'Planet.g.dart';

@JsonSerializable()
class Planet {
  final String name;
  final String distance;

  Planet({this.name, this.distance});

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);
}
