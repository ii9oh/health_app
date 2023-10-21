import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/scr/model/food.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  const Entry._();

  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory Entry({
    required String id,
    required Food food,
    required DateTime enteredAt,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  factory Entry.empty() {
    return Entry(
      id: "",
      food: Food.empty(),
      enteredAt: DateTime.now(),
    );
  }

  bool get isSaved {
    return id != '';
  }
}
