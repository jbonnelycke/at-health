import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Insurance {
  Insurance({
    @required this.id,
    @required this.provider,
    @required this.memberid,
    @required this.groupid,
  });
  final String id;
  final String provider;
  final String groupid;
  final String memberid;
}