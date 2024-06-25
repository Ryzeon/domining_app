// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      downloadUrl: json['downloadUrl'] as String?,
      viewUrl: json['viewUrl'] as String?,
      niceFileSize: json['niceFileSize'] as String?,
    );

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'downloadUrl': instance.downloadUrl,
      'viewUrl': instance.viewUrl,
      'niceFileSize': instance.niceFileSize,
    };
