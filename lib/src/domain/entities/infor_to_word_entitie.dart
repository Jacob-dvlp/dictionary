import 'package:dictionary_app/src/domain/entities/license_entitie.dart';
import 'package:dictionary_app/src/domain/entities/meaning_entitie.dart';
import 'package:dictionary_app/src/domain/entities/phonetic_entitie.dart';
import 'package:equatable/equatable.dart';

class InforToWordEntitie extends Equatable {
  final String wordInfo;
  final String? phoneticInfo;
  final List<PhoneticEntitie> phoneticsEntitie;
  final List<MeaningEntitie> meaningsEntitie;
  final LicenseEntitie licenseEntitie;
  final List<String> sourceUrlsInfo;

  const InforToWordEntitie({
    required this.wordInfo,
    this.phoneticInfo,
    required this.phoneticsEntitie,
    required this.meaningsEntitie,
    required this.licenseEntitie,
    required this.sourceUrlsInfo,
  });

  @override
  List<Object?> get props => [
        wordInfo,
        phoneticInfo,
        phoneticsEntitie,
        meaningsEntitie,
        licenseEntitie,
        sourceUrlsInfo
      ];
}
