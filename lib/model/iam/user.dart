import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(
      {this.id,
      this.username,
      this.email,
      this.names,
      this.lastNames,
      this.position,
      this.company,
      this.about});

  String? id;
  String? username;
  String? email;
  String? names;
  String? lastNames;
  String? position;
  String? company;
  String? about;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
