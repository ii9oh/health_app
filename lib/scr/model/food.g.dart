// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodImpl _$$FoodImplFromJson(Map<String, dynamic> json) => _$FoodImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      calories: json['calories'] as int,
      fat: json['fat'] as int,
      sugar: json['sugar'] as int,
      protein: json['protein'] as int,
    );

Map<String, dynamic> _$$FoodImplToJson(_$FoodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calories': instance.calories,
      'fat': instance.fat,
      'sugar': instance.sugar,
      'protein': instance.protein,
    };
