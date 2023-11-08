import 'package:dartz/dartz.dart';
import 'package:dictionary_app/src/errors/failure.dart';

import '../entities/dictionary_entitie.dart';


abstract class GetWordDictionaryRepository {
  Future<Either<Failure,WordsDictionaryModelEntitie>> getWordDictionary();
}
