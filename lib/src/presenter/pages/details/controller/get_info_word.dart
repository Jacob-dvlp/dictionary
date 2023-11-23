import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/provider/app_provider.dart';



final getInfoWordProviderFuture = FutureProviderFamily((ref, arg) {
  String convertObjToString = arg as String;
  return ref.watch(AppProviders.getInfoWord).getInforWord(word: convertObjToString);
});
