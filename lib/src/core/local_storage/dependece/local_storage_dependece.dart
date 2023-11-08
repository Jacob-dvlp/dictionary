import 'package:dictionary_app/src/core/local_storage/local_storage.dart';
import 'package:dictionary_app/src/core/local_storage/local_storage_imp.dart';
import 'package:get_it/get_it.dart';

class LocalStorageDependece {
  static final getIt = GetIt.instance;

  LocalStorageDependece._() {
    getItsetUp();
  }
  //localStorage
static getItsetUp() {
    getIt.registerFactory<LocalStorage>(
      () => LocalStorageImp(),
    );
  }
}
