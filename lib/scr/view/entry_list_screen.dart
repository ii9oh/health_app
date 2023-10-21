import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/domain/controller/entry_list_controller.dart';
import 'package:health_app/scr/shared/entry_list.dart';
import 'package:health_app/scr/shared/food_picker.dart';

class EntryListScreen extends ConsumerWidget {
  const EntryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entry"),
      ),
      body: const EntryList(date: "foobar"),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return FoodPicker(
                  onSelect: (food) {
                    ref
                        .read(entryListNotifier('foobar').notifier)
                        .addEntry(food);
                  },
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
