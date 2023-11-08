import 'package:equatable/equatable.dart';

class PhoneticEntitie  extends Equatable{
   final String textWord;
   final String audioWord;
   final String? sourceUrlWord;

   const PhoneticEntitie({
        required this.textWord,
        required this.audioWord,
        this.sourceUrlWord,
    });


    
      @override
      List<Object?> get props => [textWord,audioWord,sourceUrlWord];
}