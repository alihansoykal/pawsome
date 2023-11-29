// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedListResponse _$BreedListResponseFromJson(Map<String, dynamic> json) =>
    BreedListResponse(
      status: json['status'] as String?,
      message: (json['message'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$BreedListResponseToJson(BreedListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

RandomImageResponse _$RandomImageResponseFromJson(Map<String, dynamic> json) =>
    RandomImageResponse(
      status: json['status'] as String?,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$RandomImageResponseToJson(
        RandomImageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

SimpleListResponse _$SimpleListResponseFromJson(Map<String, dynamic> json) =>
    SimpleListResponse(
      status: json['status'] as String?,
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SimpleListResponseToJson(SimpleListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

ImageListResponse _$ImageListResponseFromJson(Map<String, dynamic> json) =>
    ImageListResponse(
      status: json['status'] as String?,
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ImageListResponseToJson(ImageListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
