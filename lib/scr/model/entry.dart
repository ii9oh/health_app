import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/scr/model/food.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  factory Entry({
    required int id,
    required Food food,
    required DateTime enteredAt,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
