import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/main.dart';
import 'package:health_app/scr/domain/controller/food_form_controller.dart';
import 'package:health_app/scr/model/food.dart';
import 'package:health_app/scr/shared/food_form.dart';

class FoodCard extends ConsumerWidget {
  final Food food;
  const FoodCard(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.dining),
      title: Text(food.name),
      subtitle: Text(food.caption),
      trailing: PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              onTap: () {
                ref.read(foodFormController.notifier).load(food);
                showModalBottomSheet(
                  context: rootNavigatorKey.currentContext!,
                  isScrollControlled: true,
                  builder: (context) {
                    return const FoodForm();
                  },
                );
              },
              child: const Text("Edit"),
            ),
          ];
        },
      ),
    );
  }
}
