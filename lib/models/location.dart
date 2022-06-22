import 'package:sr_construccion/models/coordinates.dart';
import 'package:sr_construccion/models/timezone.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable()
class Location {
  String street;
  String city;
  String state;
  String postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
