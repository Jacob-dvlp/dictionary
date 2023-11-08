import '../../domain/entities/license_entitie.dart';

class License  extends LicenseEntitie{
  final  String name;
   final String url;

   const License({
        required this.name,
        required this.url,
    }):super(nameWord: name,urlWord: url);

    factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}