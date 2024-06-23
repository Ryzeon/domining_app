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

  final String? id;
  final String? username;
  final String? email;
  final String? names;
  final String? lastNames;
  final String? position;
  final String? company;
  final String? about;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
