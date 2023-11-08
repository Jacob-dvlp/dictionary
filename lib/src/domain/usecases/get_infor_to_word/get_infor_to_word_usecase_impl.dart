import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../../entities/infor_to_word_entitie.dart';

abstract 
class GetInforToWordUsecase {
    Future<Either<Failure, List<InforToWordEntitie>>> getInforWord({required String word});

}