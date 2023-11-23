import 'package:dictionary_app/src/core/htpp/http_dio.dart';
import 'package:dictionary_app/src/core/htpp/i_http.dart';
import 'package:dictionary_app/src/core/local_storage/local_storage.dart';
import 'package:dictionary_app/src/core/local_storage/local_storage_imp.dart';
import 'package:dictionary_app/src/domain/usecases/get_infor_to_word/get_infor_to_word_usecase.dart';
import 'package:dictionary_app/src/infra/datasources/get_word_dictionary_datasource_impl.dart';
import 'package:dictionary_app/src/infra/repository/get_info_to_word_repository.dart';
import 'package:dictionary_app/src/infra/repository/get_word_dictionary_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/repository/get_infor_to_word_repository.dart';
import '../../domain/repository/get_word_dictionary_repository_imp.dart';
import '../../domain/usecases/get_infor_to_word/get_infor_to_word_usecase_impl.dart';
import '../../domain/usecases/get_word_dictionary_usecase.dart';
import '../../domain/usecases/get_word_dictionary_usecase_imp.dart';
import '../../infra/datasources/get_info_to_word_datasource/get_info_to_word_datasource.dart';
import '../../infra/datasources/get_info_to_word_datasource/get_info_to_word_datasource_impl.dart';
import '../../infra/datasources/get_word_dictionary_datasource.dart';

class AppProviders {

  static final http = Provider<IHttp>(
    (ref) => HttpDio(),
  );
  static final localStorage =
      Provider<LocalStorage>((ref) => LocalStorageImp());

  static final getWordDictionaryDatasourceProvider =
      Provider<GetWordDictionaryDatasource>(
    (ref) => GetWordDictionaryDatasourceImpl(),
  );

  static final getWordsDictionaryRepositoryProvider =
      Provider<GetWordDictionaryRepository>(
    (ref) => GetWordDictionaryRepositoryImpl(
      getWordDictionaryDatasource: GetWordDictionaryDatasourceImpl(),
    ),
  );

  static final getWordsDictionaryUsecase =
      Provider<GetWordDictionaryUsecase>((ref) {
    final weatherDataSource = ref.watch(getWordsDictionaryRepositoryProvider);
    return GetWordDictionaryUsecaseImp(
        getWordDictionaryRepositoryImp: weatherDataSource);
  });

  static final getInfoWordDatasource = Provider<GetInfoToWordDatasource>(
    (ref) => GetInfoToWordDatasourceImpl(
      iHttp: ref.watch(http),
      localStorageImp: ref.watch(localStorage),
    ),
  );

  static final getInfoWordRepositoryProvider =
      Provider<GetInforToWordRepository>(
    (ref) => GetInfoToWordRepository(
      getInfoToWordDatasource: GetInfoToWordDatasourceImpl(
        iHttp: ref.watch(http),
        localStorageImp: ref.watch(localStorage),
      ),
    ),
  );

  static final getInfoWord = Provider<GetInforToWordUsecase>(
    (ref) => GetInforToWordUsecaseImpl(
      getInforToWordRepository: ref.watch(getInfoWordRepositoryProvider),
    ),
  );
}
