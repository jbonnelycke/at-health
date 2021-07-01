import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal.g.dart';

@JsonSerializable()
class Personal {
  Personal({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.contact,
    @required this.dob,
    @required this.height,
    @required this.weight,
});
  final String id;
  final String name;
  final String address;
  final String contact;
  final String dob;
  final String height;
  final String weight;

  factory Personal.fromJson(Map<String, dynamic> json) => _$PersonalFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalToJson(this);
}