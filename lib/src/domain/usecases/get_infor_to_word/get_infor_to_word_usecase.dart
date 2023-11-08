
import 'package:dartz/dartz.dart';
import 'package:dictionary_app/src/core/htpp/http_exception.dart';

import 'package:dictionary_app/src/domain/entities/infor_to_word_entitie.dart';

import 'package:dictionary_app/src/errors/failure.dart';

import '../../repository/get_infor_to_word_repository.dart';
import 'get_infor_to_word_usecase_impl.dart';

class GetInforToWordUsecaseImpl extends GetInforToWordUsecase {
  final GetInforToWordRepository getInforToWordRepository;

  GetInforToWordUsecaseImpl({required this.getInforToWordRepository});
  @override
  Future<Either<Failure, List<InforToWordEntitie>>> getInforWord({required String word}) async {
    try {
      final response = await getInforToWordRepository.getInforWord(word: word);
      final result = response.fold(
        (l) => null,
        (r) => r,
      );
      return Right(result!);
    } on HttpExceptionCustom catch(e){
      return  Left(ServerFailure(e.response.data));
    } 
  }
}


