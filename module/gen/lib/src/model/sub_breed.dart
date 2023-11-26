import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_breed.g.dart';

@JsonSerializable()
@immutable
final class SubBreed with EquatableMixin {
  final List<String>? message;
  final String? status;

  SubBreed({
    this.message,
    this.status,
  });

  factory SubBreed.fromJson(Map<String, dynamic> json) => _$SubBreedFromJson(json);

  Map<String, dynamic> toJson() => _$SubBreedToJson(this);

  @override
  List<Object?> get props => [message, status];

  SubBreed copyWith({
    List<String>? message,
    String? status,
  }) {
    return SubBreed(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
