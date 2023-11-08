import 'package:dartz/dartz.dart';
import 'package:dictionary_app/src/errors/failure.dart';

import '../entities/infor_to_word_entitie.dart';

abstract class GetInforToWordRepository {
  Future<Either<Failure, List<InforToWordEntitie>>> getInforWord({required String word});
}
