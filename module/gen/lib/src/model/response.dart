// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'response.g.dart';

@JsonSerializable()
class Response extends INetworkModel<Response> with EquatableMixin {
  Response({this.message, this.status});

  /// Get Response from json
  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  final String? message;
  final String? status;

  @override
  List<Object?> get props => [message, status];

  /// Response model to map object
  @override
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  @override
  Response fromJson(Map<String, dynamic> json) {
    return _$ResponseFromJson(json);
  }

  Response copyWith({
    String? message,
    String? status,
  }) {
    return Response(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
