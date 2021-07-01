// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personal _$PersonalFromJson(Map<String, dynamic> json) {
  return Personal(
    id: json['id'] as String,
    name: json['name'] as String,
    address: json['address'] as String,
    contact: json['contact'] as String,
    dob: json['dob'] as String,
    height: json['height'] as String,
    weight: json['weight'] as String,
  );
}

Map<String, dynamic> _$PersonalToJson(Personal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'contact': instance.contact,
      'dob': instance.dob,
      'height': instance.height,
      'weight': instance.weight,
    };
