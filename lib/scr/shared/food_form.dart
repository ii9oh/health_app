import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_app/scr/domain/controller/food_form_controller.dart';

class FoodForm extends ConsumerWidget {
  const FoodForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(foodFormController.notifier);
    final food = ref.watch(foodFormController);
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.isSaved ? "Edit Food" : "Add food",
                  // style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextFormField(
                  controller: controller.nameController,
                  validator: controller.nameValidator,
                  decoration: const InputDecoration(
                    label: Text("Name"),
                  ),
                  autofocus: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.caloriesController,
                          validator: controller.numberValidator,
                          decoration: const InputDecoration(
                            label: Text("Calories"),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ]),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: controller.proteinController,
                          validator: controller.numberValidator,
                          decoration: const InputDecoration(
                            label: Text("Protein (g)"),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.fatController,
                        validator: controller.numberValidator,
                        decoration: const InputDecoration(
                          label: Text("Fat (g)"),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.sugarController,
                        validator: controller.numberValidator,
                        decoration: const InputDecoration(
                          label: Text("Sugar (g)"),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                ElevatedButton(
                    onPressed: () async {
                      final isNew = !food.isSaved;
                      final success = await controller.submit();
                      if (success == null) return;
                      if (success) {
                        // rootScaffoldMessengerKey.currentState!.showSnackBar(
                        //     SnackBar(content: Text("Food Added")));
                        Fluttertoast.showToast(
                          msg: isNew
                              ? "${food.name} added"
                              : "${food.name} Updated",
                          gravity: ToastGravity.TOP,
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text("Create"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
