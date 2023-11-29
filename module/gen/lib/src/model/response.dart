// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'response.g.dart';

abstract class BaseResponse extends Equatable {
  final String? status;

  const BaseResponse({this.status});

  @override
  List<Object?> get props => [status];
}

@JsonSerializable()
class BreedListResponse extends BaseResponse implements INetworkModel<BreedListResponse> {
  final Map<String, List<String>> message;

  const BreedListResponse({String? status, required this.message}) : super(status: status);

  factory BreedListResponse.fromJson(Map<String, dynamic> json) => _$BreedListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BreedListResponseToJson(this);

  @override
  BreedListResponse fromJson(Map<String, dynamic> json) {
    return BreedListResponse.fromJson(json);
  }
}

@JsonSerializable()
class RandomImageResponse extends BaseResponse implements INetworkModel<RandomImageResponse> {
  final String message;

  const RandomImageResponse({String? status, this.message = ''}) : super(status: status);

  factory RandomImageResponse.fromJson(Map<String, dynamic> json) => _$RandomImageResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RandomImageResponseToJson(this);

  @override
  RandomImageResponse fromJson(Map<String, dynamic> json) {
    return RandomImageResponse.fromJson(json);
  }
}

@JsonSerializable()
class SimpleListResponse extends BaseResponse implements INetworkModel<SimpleListResponse> {
  final List<String> message;

  const SimpleListResponse({String? status, required this.message}) : super(status: status);

  factory SimpleListResponse.fromJson(Map<String, dynamic> json) => _$SimpleListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SimpleListResponseToJson(this);

  @override
  SimpleListResponse fromJson(Map<String, dynamic> json) {
    return SimpleListResponse.fromJson(json);
  }
}

@JsonSerializable()
class ImageListResponse extends BaseResponse implements INetworkModel<ImageListResponse> {
  final List<String> message;

  const ImageListResponse({String? status, required this.message}) : super(status: status);

  factory ImageListResponse.fromJson(Map<String, dynamic> json) => _$ImageListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageListResponseToJson(this);

  @override
  ImageListResponse fromJson(Map<String, dynamic> json) {
    return ImageListResponse.fromJson(json);
  }
}
