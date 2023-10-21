// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryImpl _$$EntryImplFromJson(Map json) => _$EntryImpl(
      id: json['id'] as String,
      food: Food.fromJson(Map<String, Object?>.from(json['food'] as Map)),
      enteredAt: DateTime.parse(json['enteredAt'] as String),
    );

Map<String, dynamic> _$$EntryImplToJson(_$EntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food': instance.food.toJson(),
      'enteredAt': instance.enteredAt.toIso8601String(),
    };
