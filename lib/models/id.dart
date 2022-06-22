import 'package:json_annotation/json_annotation.dart';
part 'id.g.dart';

@JsonSerializable()
class Id {
  String name;
  String value;

  Id({
    this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}
