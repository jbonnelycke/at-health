import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'immunization.g.dart';

@JsonSerializable()
class Immunization {
  Immunization({
    @required this.id,
    @required this.immunizations,
    @required this.allergies,
  });
  final String id;
  final String immunizations;
  final String allergies;

  factory Immunization.fromJson(Map<String, dynamic> json) => _$ImmunizationFromJson(json);
  Map<String, dynamic> toJson() => _$ImmunizationToJson(this);
}