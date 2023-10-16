import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/domain/controller/food_form_controller.dart';
import 'package:health_app/scr/domain/controller/food_list_conroller.dart';

import 'package:health_app/scr/shared/food_form.dart';
import 'package:health_app/scr/shared/food_list.dart';

class FoodListScreen extends ConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food"),
      ),
      body: const FoodList(
        type: FoodListType.all,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ref.read(foodFormController.notifier).clear();
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const FoodForm();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
