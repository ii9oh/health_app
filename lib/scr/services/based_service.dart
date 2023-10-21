import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class BasedService {
  Future<CollectionBox<Map<dynamic, dynamic>>> getBox(String boxName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'app',
      {boxName},
      path: directory.path,
    );
    final foodBox = await collection.openBox<Map>(boxName);

    return foodBox;
  }
}
