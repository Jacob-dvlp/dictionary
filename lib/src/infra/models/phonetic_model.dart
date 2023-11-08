import '../../domain/entities/phonetic_entitie.dart';

class Phonetic extends PhoneticEntitie {
  final String text;
  final String audio;
  final String? sourceUrl;

  const Phonetic({
    required this.text,
    required this.audio,
    this.sourceUrl,
  }) : super(audioWord: audio, textWord: text, sourceUrlWord: sourceUrl);

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"]?? "",
        audio: json["audio"]?? "",
        sourceUrl: json["sourceUrl"]??"",
      );
}
