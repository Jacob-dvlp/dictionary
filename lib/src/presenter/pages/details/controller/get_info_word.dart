import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/infor_to_word_entitie.dart';
import '../../../../errors/failure.dart';
import '../../../../provider/app_provider.dart';

FutureProvider<Either<Failure, List<InforToWordEntitie>>>
    getInfoWordProviderFuture({ref, String? value}) => FutureProvider((ref){

      return  ref.watch(AppProviders.getInfoWord).getInforWord(word: value!);
    });

