

import '../../presenter/pages/details/dependecies/app_dependecies.dart';
import '../../presenter/pages/word/dependecies/app_dependecies.dart';
import '../local_storage/dependece/local_storage_dependece.dart';

class GetitSetup {
  GetitSetup(){
    AppDependeciesHome.getItSetUp();
    AppDependeciesDetails.getItsetUp();
    LocalStorageDependece.getItsetUp();
  }
}