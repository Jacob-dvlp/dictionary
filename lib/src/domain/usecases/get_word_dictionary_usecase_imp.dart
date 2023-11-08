
import 'package:dartz/dartz.dart';
import 'package:dictionary_app/src/errors/failure.dart';

import '../../core/htpp/http_exception.dart';
import '../entities/dictionary_entitie.dart';
import '../repository/get_word_dictionary_repository_imp.dart';
import 'get_word_dictionary_usecase.dart';

 class GetWordDictionaryUsecaseImp  extends GetWordDictionaryUsecase {
    final GetWordDictionaryRepository getWordDictionaryRepositoryImp;

  GetWordDictionaryUsecaseImp({required this.getWordDictionaryRepositoryImp});

 @override
  Future<Either<Failure,WordsDictionaryModelEntitie>> getWordDictionary()async {
    try {
       final response = await  getWordDictionaryRepositoryImp.getWordDictionary();
       final data = response.fold((l) => null, (r) => r);
      return Right(data!);
    } on HttpExceptionCustom catch (e) {
      return throw Left(ServerFailure(e.response));
    }
  }}

