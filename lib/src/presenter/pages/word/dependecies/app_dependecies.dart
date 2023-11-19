import 'package:get_it/get_it.dart';

import '../../../../domain/repository/get_word_dictionary_repository_imp.dart';
import '../../../../domain/usecases/get_word_dictionary_usecase.dart';
import '../../../../domain/usecases/get_word_dictionary_usecase_imp.dart';
import '../../../../infra/datasources/get_word_dictionary_datasource.dart';
import '../../../../infra/datasources/get_word_dictionary_datasource_impl.dart';
import '../../../../infra/repository/get_word_dictionary_repository.dart';
import '../controllers/words_dictionary_cubit.dart';

class AppDependeciesHome {
  AppDependeciesHome._() {
    getItSetUp();
  }

  static final getIt = GetIt.instance;

  static getItSetUp() {
    //bloc_cubit

    getIt.registerFactory(
      () => WordsDictionaryCubit(
        getWordDictionaryUsecaseImp: getIt.get(),
      ),
    );

    //datasource
    getIt.registerLazySingleton<GetWordDictionaryDatasource>(
      () => GetWordDictionaryDatasourceImpl(),
    );

    //repository
    getIt.registerLazySingleton<GetWordDictionaryRepository>(
      () => GetWordDictionaryRepositoryImpl(
        getWordDictionaryDatasource: getIt.get(),
      ),
    );
 
    //usecase
    getIt.registerLazySingleton<GetWordDictionaryUsecase>(
      () => GetWordDictionaryUsecaseImp(
        getWordDictionaryRepositoryImp: getIt.get(),
      ),
    );
  }
}
