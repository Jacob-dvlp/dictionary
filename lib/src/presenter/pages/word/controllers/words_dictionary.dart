import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../domain/entities/dictionary_entitie.dart';
import '../../../../errors/failure.dart';
import '../../../../provider/app_provider.dart';

final wordsDictionary =
    FutureProvider<Either<Failure, WordsDictionaryModelEntitie>>((ref) {
  return ref.watch(getWordsDictionaryUsecase).getWordDictionary();
});
