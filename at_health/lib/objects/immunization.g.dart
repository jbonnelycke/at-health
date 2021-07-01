// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immunization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Immunization _$ImmunizationFromJson(Map<String, dynamic> json) {
  return Immunization(
    id: json['id'] as String,
    immunizations: json['immunizations'] as String,
    allergies: json['allergies'] as String,
  );
}

Map<String, dynamic> _$ImmunizationToJson(Immunization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'immunizations': instance.immunizations,
      'allergies': instance.allergies,
    };
