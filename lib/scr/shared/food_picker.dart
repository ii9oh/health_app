import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/scr/domain/controller/food_list_controller.dart';
import 'package:health_app/scr/model/food.dart';

class FoodPicker extends ConsumerWidget {
  final Function(Food food) onSelect;
  const FoodPicker({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = ref.watch(foodListNotifier(FoodListType.all));
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose Food",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            ListView.builder(
              itemCount: foods.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final food = foods[index];
                return Card(
                  child: ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(food.name),
                    trailing: const Icon(Icons.add),
                    onTap: () {
                      onSelect(food);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
