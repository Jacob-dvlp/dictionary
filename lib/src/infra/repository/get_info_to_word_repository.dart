
import 'package:dartz/dartz.dart';

import 'package:dictionary_app/src/domain/entities/infor_to_word_entitie.dart';

import 'package:dictionary_app/src/errors/failure.dart';

import '../../core/htpp/http_exception.dart';
import '../../domain/repository/get_infor_to_word_repository.dart';
import '../datasources/get_info_to_word_datasource/get_info_to_word_datasource.dart';

class GetInfoToWordRepository extends GetInforToWordRepository {
  final GetInfoToWordDatasource getInfoToWordDatasource;

  GetInfoToWordRepository({required this.getInfoToWordDatasource});
  @override
  Future<Either<Failure, List<InforToWordEntitie>>> getInforWord(
      {required String word}) async {
    try {
      final response = await getInfoToWordDatasource.getInforWord(word: word);
      return Right(response);
    } on HttpExceptionCustom catch (e) {
      return Left(ConnectionFailure(e.response));
    }
  }
}
