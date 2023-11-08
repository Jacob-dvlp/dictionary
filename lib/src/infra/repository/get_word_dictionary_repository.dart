
import 'package:dartz/dartz.dart';
import 'package:dictionary_app/src/errors/failure.dart';

import '../../core/htpp/http_exception.dart';
import '../../domain/repository/get_word_dictionary_repository_imp.dart';
import '../datasources/get_word_dictionary_datasource.dart';
import '../models/words_dictionary_model.dart';

class GetWordDictionaryRepositoryImpl extends GetWordDictionaryRepository {
  final GetWordDictionaryDatasource getWordDictionaryDatasource;

  GetWordDictionaryRepositoryImpl(
      {required this.getWordDictionaryDatasource});

  @override
  Future<Either<Failure, WordsDictionaryModel>> getWordDictionary() async {
    try {
      final response =
          await getWordDictionaryDatasource.getWordDictionary();
      return Right(response);
    }on HttpExceptionCustom catch (e) {
      return Left(ConnectionFailure(e.response));
    } 
}}
