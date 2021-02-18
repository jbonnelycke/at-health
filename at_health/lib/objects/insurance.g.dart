// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Insurance _$InsuranceFromJson(Map<String, dynamic> json) {
  return Insurance(
    id: json['id'] as String,
    provider: json['provider'] as String,
    memberid: json['memberid'] as String,
    groupid: json['groupid'] as String,
  );
}

Map<String, dynamic> _$InsuranceToJson(Insurance instance) => <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'groupid': instance.groupid,
      'memberid': instance.memberid,
    };
