import 'package:json_annotation/json_annotation.dart';
part 'registered.g.dart';

@JsonSerializable()
class Registered {
  String date;
  int age;

  Registered({
    this.date,
    this.age,
  });

  factory Registered.fromJson(Map<String, dynamic> json) =>
      _$RegisteredFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredToJson(this);
}
