import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/model/entry.dart';
import 'package:health_app/scr/services/based_service.dart';

class EntryService extends BasedService {
  static const boxName = "entry";

  Future<List<Entry>> list() async {
    final box = await getBox(boxName);
    final items = await box.getAllValues();

    List<Entry> entries = [];
    for (final entry in items.entries) {
      final Map<String, dynamic> data = {
        ...entry.value,
        'id': entry.key,
      };

      entries.add(Entry.fromJson(data));
      entries.sort((a, b) => a.enteredAt.isAfter(b.enteredAt) ? 1 : -1);
    }
    return entries;
  }

  Future<Entry?> create(Entry entry) async {
    try {
      final box = await getBox(boxName);
      final id = entry.isSaved ? entry.id : shortHash(UniqueKey());

      box.put(id, entry.toJson());

      return Entry.fromJson({...entry.toJson(), "id": id});
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> delete(String id) async {
    try {
      final box = await getBox(boxName);

      box.delete(id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
