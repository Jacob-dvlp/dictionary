import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalStorage {

 Future<void> save({required String key, required String value, required Box<dynamic> localStorage});
 Future<String> readStorage({ required dynamic key,required Box<dynamic> localStorage});
 Future delete({ required String key ,required Box<dynamic> localStorage});
}
