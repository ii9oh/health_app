import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/scr/domain/controller/entry_list_controller.dart';
import 'package:health_app/scr/services/entry_service.dart';
import 'package:health_app/scr/shared/entry_card.dart';

class EntryList extends ConsumerWidget {
  final String date;

  const EntryList({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(entryListNotifier(date));
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];

        return Container(
          color: Colors.red.shade400,
          child: Dismissible(
            key: Key(entry.id),
            onDismissed: ((_) async {
              await EntryService().delete(entry.id);

              ref.read(entryListNotifier('foobar').notifier).removeAt(index);
            }),
            direction: DismissDirection.endToStart,
            child: Container(
              color: Colors.white,
              child: EntryCard(entry: entry),
            ),
          ),
        );
      },
    );
  }
}
