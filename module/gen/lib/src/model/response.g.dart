// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
