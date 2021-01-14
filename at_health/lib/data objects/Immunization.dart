import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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
}