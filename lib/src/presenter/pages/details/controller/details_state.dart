part of 'details_cubit.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsEmpty extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final List<InforToWordEntitie>? inforToWordEntitie;

  const DetailsSuccess({required this.inforToWordEntitie});

  @override
  List<Object> get props => [inforToWordEntitie!];
}

class DetailsLoadFailure extends DetailsState {
  final String mensage;

  const DetailsLoadFailure({required this.mensage});

  @override
  List<Object> get props => [mensage];
}
