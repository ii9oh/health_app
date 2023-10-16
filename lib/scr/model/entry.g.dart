// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryImpl _$$EntryImplFromJson(Map<String, dynamic> json) => _$EntryImpl(
      id: json['id'] as int,
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
      enteredAt: DateTime.parse(json['enteredAt'] as String),
    );

Map<String, dynamic> _$$EntryImplToJson(_$EntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food': instance.food,
      'enteredAt': instance.enteredAt.toIso8601String(),
    };
