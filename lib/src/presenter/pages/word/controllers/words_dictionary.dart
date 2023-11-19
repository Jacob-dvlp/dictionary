import 'package:dartz/dartz.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../domain/entities/dictionary_entitie.dart';
import '../../../../errors/failure.dart';
import '../../../../provider/app_provider.dart';

final wordsDictionaryFuture =
    FutureProvider<Either<Failure, WordsDictionaryModelEntitie>>((ref) {
  return ref.watch(AppProviders.getWordsDictionaryUsecase).getWordDictionary();
});
