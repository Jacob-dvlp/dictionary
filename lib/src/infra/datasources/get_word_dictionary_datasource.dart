
import 'package:dictionary_app/src/infra/models/words_dictionary_model.dart';


abstract class GetWordDictionaryDatasource  {
  
  Future<WordsDictionaryModel> getWordDictionary();
}
