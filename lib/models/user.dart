import 'package:sr_construccion/models/dod.dart';
import 'package:sr_construccion/models/id.dart';
import 'package:sr_construccion/models/location.dart';
import 'package:sr_construccion/models/loging.dart';
import 'package:sr_construccion/models/name.dart';
import 'package:sr_construccion/models/picture.dart';
import 'package:sr_construccion/models/registered.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Registered registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  User(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.login,
      this.dob,
      this.registered,
      this.phone,
      this.cell,
      this.id,
      this.picture,
      this.nat});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
