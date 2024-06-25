import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';
@JsonSerializable()
class FileModel {
  final String? name;
  final String? id;
  final String? downloadUrl;
  final String? viewUrl;
  final String? niceFileSize;

  FileModel({this.name, this.id, this.downloadUrl, this.viewUrl, this.niceFileSize});

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}
