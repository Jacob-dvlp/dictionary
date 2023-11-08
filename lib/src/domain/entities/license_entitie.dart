import 'package:equatable/equatable.dart';

class LicenseEntitie extends Equatable {
  final String nameWord;
  final String urlWord;
  
  const LicenseEntitie({
    required this.nameWord,
    required this.urlWord,
  });

  @override
  List<Object?> get props => [nameWord, urlWord];
}
