

import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../entities/dictionary_entitie.dart';

abstract class GetWordDictionaryUsecase  {
  Future<Either<Failure,WordsDictionaryModelEntitie>> getWordDictionary();
}
