import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food with _$Food {
  const Food._();
  factory Food({
    required String id,
    required String name,
    required int calories,
    required int fat,
    required int sugar,
    required int protein,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  factory Food.empty() {
    return Food(
      id: '',
      name: "",
      calories: 0,
      fat: 0,
      sugar: 0,
      protein: 0,
    );
  }

  bool get isSaved {
    return id != '';
  }

  String get caption {
    return "$calories cal | $fat g fat";
  }
}
