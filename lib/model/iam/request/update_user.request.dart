import 'package:json_annotation/json_annotation.dart';

part 'update_user.request.g.dart';
@JsonSerializable()
class UpdateUserRequest {
  final String? names;
  final String? username;
  final String? lastNames;
  final String? position;
  final String? company;
  final String? about;

  UpdateUserRequest({
    this.names,
    this.username,
    this.lastNames,
    this.position,
    this.company,
    this.about,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
