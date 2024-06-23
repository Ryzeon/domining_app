import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';
@JsonSerializable()
class File {
  final String? name;
  final String? id;
  final String? downloadUrl;
  final String? viewUrl;
  final String? niceFileSize;

  File({this.name, this.id, this.downloadUrl, this.viewUrl, this.niceFileSize});

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
