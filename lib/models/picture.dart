import 'package:json_annotation/json_annotation.dart';
part 'picture.g.dart';

@JsonSerializable()
class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
