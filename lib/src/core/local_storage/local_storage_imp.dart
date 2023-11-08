// ignore_for_file: depend_on_referenced_packages

import 'local_storage.dart';
import 'package:hive/hive.dart';

class LocalStorageImp implements LocalStorage {
  @override
  Future delete({required String key, required Box localStorage}) async {
    final hive = await localStorage.delete(key);
    return hive;
  }

  @override
  Future<String> readStorage(
      {required dynamic key, required Box localStorage}) async {
    final hive = await localStorage.get(key);
    return hive;
  }
  
  @override
  Future<void> save(
      {required String key,
      required String value,
      required Box localStorage}) async {
    final hive = await localStorage.put(key, value);
    return hive;
  }
}
