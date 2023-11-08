import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dictionary_app/src/domain/entities/infor_to_word_entitie.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/usecases/get_infor_to_word/get_infor_to_word_usecase_impl.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetInforToWordUsecase getInforToWordUsecase;
  DetailsCubit({required this.getInforToWordUsecase}) : super(DetailsInitial());

  Future getInfo({required String word}) async {
    try {
      emit(DetailsInitial());
      final response = await getInforToWordUsecase.getInforWord(word: word);
      emit(response.fold(
          (l) => DetailsLoadFailure(mensage: l.httpResponse.message!),
          (r) => DetailsSuccess(inforToWordEntitie: r)));
    } on SocketException catch (e) {
      emit(DetailsLoadFailure(mensage: e.message));
    }
  }
}




