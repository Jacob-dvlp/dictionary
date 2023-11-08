
import '../../models/dictionary_model.dart';

abstract 
class GetInfoToWordDatasource {
      Future<List<WordsDictionaryModelInfor>> getInforWord({required String word});

}