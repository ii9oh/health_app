import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/model/food.dart';
import 'package:health_app/scr/services/based_service.dart';

class FoodService extends BasedService {
  static const boxName = "food";

  Future<List<Food>> list() async {
    final box = await getBox(boxName);
    final items = await box.getAllValues();

    List<Food> foods = [];
    for (final entry in items.entries) {
      final Map<String, Object?> data = {
        ...entry.value,
        'id': entry.key,
      };

      foods.add(Food.fromJson(data));
      print(data);
    }
    return foods;
  }

  Future<Food?> create(Food food) async {
    try {
      final box = await getBox(boxName);
      final id = food.isSaved ? food.id : shortHash(UniqueKey());

      box.put(id, food.toJson());

      return Food.fromJson({...food.toJson(), "id": id});
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> delete(String id) async {
    try {
      final box = await getBox(boxName);

      box.delete(id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
