import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/model/entry.dart';

class EntryCard extends ConsumerWidget {
  const EntryCard({
    super.key,
    required this.entry,
  });

  final Entry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(entry.food.name),
      subtitle: Text(entry.enteredAt.toString()),
    );
  }
}
