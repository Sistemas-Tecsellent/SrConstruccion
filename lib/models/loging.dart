import 'package:json_annotation/json_annotation.dart';
part 'loging.g.dart';

@JsonSerializable()
class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
