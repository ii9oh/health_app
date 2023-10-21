import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/domain/controller/food_list_controller.dart';
import 'package:health_app/scr/services/food_service.dart';
import 'package:health_app/scr/shared/food_card.dart';

class FoodList extends ConsumerWidget {
  final FoodListType type;

  const FoodList({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = ref.watch(foodListNotifier(type));
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index];

        return Container(
          color: Colors.red.shade400,
          child: Dismissible(
            onDismissed: (_) async {
              await FoodService().delete(food.id);

              ref.read(foodListNotifier(type).notifier).removeAt(index);
            },
            direction: DismissDirection.endToStart,
            key: Key(food.id),
            child: Container(
              color: Colors.white,
              child: FoodCard(food),
            ),
          ),
        );
      },
    );
  }
}
