// ignore_for_file: depend_on_referenced_packages

import 'package:health_app/scr/model/entry.dart';
import 'package:health_app/scr/model/food.dart';
import 'package:health_app/scr/services/entry_service.dart';

import 'package:riverpod/riverpod.dart';

class EntryListNotifier extends StateNotifier<List<Entry>> {
  final Ref ref;
  final String date;

  EntryListNotifier(this.ref, this.date, [List<Entry> initial = const []])
      : super(initial) {
    init();
  }

  init() async {
    final items = await EntryService().list();
    state = items;
  }

  addEntry(Food food) async {
    //final Entry entry = Entry(id: "", food: food, enteredAt: DateTime.now());
    final entry = Entry.empty().copyWith(food: food);

    final saveEntry = await EntryService().create(entry);
    if (saveEntry != null) {
      state = [...state, entry];
    }
  }

//   update(Food food) async {
//     if (state.firstWhereOrNull((item) => item.id == food.id) != null) {
//       final newState = [...state];
//       final index = state.indexWhere((item) => item.id == food.id);

//       newState.removeAt(index);

//       newState.insert(index, food);
//       state = newState;
//     } else {
//       state = [...state, food];
//     }
//   }

  removeAt(int index) {
    state = [...state]..removeAt(index);
  }
}

final entryListNotifier =
    StateNotifierProvider.family<EntryListNotifier, List<Entry>, String>(
        (ref, date) {
  return EntryListNotifier(ref, date);
});
