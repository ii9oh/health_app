import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/domain/controller/food_list_controller.dart';
import 'package:health_app/scr/model/food.dart';
import 'package:health_app/scr/services/food_service.dart';

class FoodFormController extends StateNotifier<Food> {
  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController fatController = TextEditingController();
  final TextEditingController sugarController = TextEditingController();

  FoodFormController(this.ref, Food model) : super(model) {
    load(model);
    addListeners();
  }

  load(Food food) {
    state = food;
    nameController.text = food.name;
    proteinController.text = food.protein == 0 ? "" : food.protein.toString();
    caloriesController.text =
        food.calories == 0 ? "" : food.calories.toString();
    fatController.text = food.fat == 0 ? "" : food.fat.toString();
    sugarController.text = food.sugar == 0 ? "" : food.sugar.toString();
  }

  clear() {
    load(Food.empty());
  }

  addListeners() {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });

    caloriesController.addListener(() {
      state =
          state.copyWith(calories: int.tryParse(caloriesController.text) ?? 0);
    });

    fatController.addListener(() {
      state = state.copyWith(fat: int.tryParse(fatController.text) ?? 0);
    });

    proteinController.addListener(() {
      state =
          state.copyWith(protein: int.tryParse(proteinController.text) ?? 0);
    });
    sugarController.addListener(() {
      state = state.copyWith(sugar: int.tryParse(sugarController.text) ?? 0);
    });
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return "Name is Required";
    return null;
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) return "Required";
    if (int.tryParse(value) == null) return "Invalid Number";
    return null;
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    final newFood = await FoodService().create(state);

    if (newFood != null) {
      ref.read(foodListNotifier(FoodListType.all).notifier).update(newFood);
      clear();
      return true;
    }

    return false;
  }
}

final foodFormController = StateNotifierProvider<FoodFormController, Food>(
    ((ref) => FoodFormController(ref, Food.empty())));
