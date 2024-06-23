// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => File(
      name: json['name'] as String?,
      id: json['id'] as String?,
      downloadUrl: json['downloadUrl'] as String?,
      viewUrl: json['viewUrl'] as String?,
      niceFileSize: json['niceFileSize'] as String?,
    );

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'downloadUrl': instance.downloadUrl,
      'viewUrl': instance.viewUrl,
      'niceFileSize': instance.niceFileSize,
    };
