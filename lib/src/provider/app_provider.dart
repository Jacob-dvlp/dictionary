import 'package:dictionary_app/src/infra/datasources/get_word_dictionary_datasource_impl.dart';
import 'package:dictionary_app/src/infra/repository/get_word_dictionary_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../domain/repository/get_word_dictionary_repository_imp.dart';
import '../domain/usecases/get_word_dictionary_usecase.dart';
import '../domain/usecases/get_word_dictionary_usecase_imp.dart';
import '../infra/datasources/get_word_dictionary_datasource.dart';

///[DataSource]


  late final getWordDictionaryDatasourceProvider =
      Provider<GetWordDictionaryDatasource>(
    (ref) => GetWordDictionaryDatasourceImpl(),
  );

  ///[Repository]

  late final getWordsDictionaryRepositoryProvider =
      Provider<GetWordDictionaryRepository>(
    (ref) => GetWordDictionaryRepositoryImpl(
      getWordDictionaryDatasource: GetWordDictionaryDatasourceImpl(),
    ),
  );

  ///[UseCase]

  late final getWordsDictionaryUsecase = Provider<GetWordDictionaryUsecase>(
    (ref) {
      final weatherDataSource = ref.watch(getWordsDictionaryRepositoryProvider);
      return GetWordDictionaryUsecaseImp(
        getWordDictionaryRepositoryImp: weatherDataSource,
      );
    },
  );

