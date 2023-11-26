// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubBreed _$SubBreedFromJson(Map<String, dynamic> json) => SubBreed(
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SubBreedToJson(SubBreed instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
