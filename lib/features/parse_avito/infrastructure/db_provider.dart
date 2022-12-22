import 'package:hive_flutter/adapters.dart';
import 'package:product_fit_avito_bitrix/features/parse_avito/domain/element_data.dart';

enum ProcessingStatus { none, finded, parsed, sended }

abstract class IDBProvider {
  Future<ProcessingStatus> getStatus(String id);
  Future<void> setFinded(String id, String html);
  Future<void> setParsed(String id, ElementData data);
  Future<void> setSended(String id);
}

class MockDBProvider implements IDBProvider {
  @override
  Future<ProcessingStatus> getStatus(String id) async {
    return ProcessingStatus.none;
  }

  @override
  Future<void> setFinded(String id, String html) async {}

  @override
  Future<void> setParsed(String id, ElementData data) async {}

  @override
  Future<void> setSended(String id) async {}
}

class DBProvider implements IDBProvider {
  static DBProvider? _instance;

  final Box box;

  static Future<DBProvider> getInstance() async {
    await Hive.initFlutter();
    _instance ??= DBProvider._(await Hive.openBox('DBProviderBox'));
    return _instance!;
  }

  DBProvider._(this.box);

  @override
  Future<ProcessingStatus> getStatus(String id) async {
    var data;
    data = box.get(id) ?? {'status': 0};
    return ProcessingStatus.values[data['status']];
  }

  @override
  Future<void> setFinded(String id, String html) async {
    await box.put(id, {'status': ProcessingStatus.finded.index});
  }

  @override
  Future<void> setParsed(String id, ElementData data) async {
    await box.put(id, {'status': ProcessingStatus.parsed.index});
  }

  @override
  Future<void> setSended(String id) async {
    await box.put(id, {'status': ProcessingStatus.sended.index});
  }
}
