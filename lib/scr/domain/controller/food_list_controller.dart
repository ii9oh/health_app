// ignore_for_file: depend_on_referenced_packages

import 'package:health_app/scr/services/food_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:health_app/scr/model/food.dart';
import 'package:collection/collection.dart';

enum FoodListType {
  all,
}

class FoodListNotifier extends StateNotifier<List<Food>> {
  final Ref ref;
  final FoodListType type;

  FoodListNotifier(this.ref, this.type, [List<Food> initial = const []])
      : super(initial) {
    init();
  }

  init() async {
    final items = await FoodService().list();
    state = items;
  }

  update(Food food) async {
    if (state.firstWhereOrNull((item) => item.id == food.id) != null) {
      final newState = [...state];
      final index = state.indexWhere((item) => item.id == food.id);

      newState.removeAt(index);

      newState.insert(index, food);
      state = newState;
    } else {
      state = [...state, food];
    }
  }

  removeAt(int index) {
    state = [...state]..removeAt(index);
  }
}

final foodListNotifier =
    StateNotifierProvider.family<FoodListNotifier, List<Food>, FoodListType>(
        (ref, type) {
  return FoodListNotifier(ref, type);
});
