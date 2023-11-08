import 'package:get_it/get_it.dart';

import '../../../../core/htpp/http_dio.dart';
import '../../../../core/htpp/i_http.dart';

import '../../../../domain/repository/get_infor_to_word_repository.dart';
import '../../../../domain/usecases/get_infor_to_word/get_infor_to_word_usecase.dart';
import '../../../../domain/usecases/get_infor_to_word/get_infor_to_word_usecase_impl.dart';
import '../../../../infra/datasources/get_info_to_word_datasource/get_info_to_word_datasource.dart';
import '../../../../infra/datasources/get_info_to_word_datasource/get_info_to_word_datasource_impl.dart';
import '../../../../infra/repository/get_info_to_word_repository.dart';
import '../controller/details_cubit.dart';

class AppDependeciesDetails {
  AppDependeciesDetails._() {
    getItsetUp();
  }

  static final getIt = GetIt.instance;

  static getItsetUp() {
    //Http
    getIt.registerLazySingleton<IHttp>(
      () => HttpDio(),
    );

    //bloc_cubit
    getIt.registerFactory(
      () => DetailsCubit(
        getInforToWordUsecase: getIt.get(),
      ),
    );


    //datasource

    getIt.registerLazySingleton<GetInfoToWordDatasource>(
      () => GetInfoToWordDatasourceImpl(
        iHttp: getIt.get(),
        localStorageImp: getIt.get(),
      ),
    );

    //repository
    getIt.registerLazySingleton<GetInforToWordRepository>(
      () => GetInfoToWordRepository(
        getInfoToWordDatasource: getIt.get(),
      ),
    );

    //UseCase
    getIt.registerLazySingleton<GetInforToWordUsecase>(
      () => GetInforToWordUsecaseImpl(
        getInforToWordRepository: getIt.get(),
      ),
    );
  }
}
