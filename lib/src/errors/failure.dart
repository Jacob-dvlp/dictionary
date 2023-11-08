import 'package:equatable/equatable.dart';

import '../core/htpp/http_response.dart';

abstract class Failure extends Equatable {
  final HttpResponse httpResponse;

  const Failure({required this.httpResponse});

  @override
  List<Object?> get props => [httpResponse];
}

class ServerFailure extends Failure {
  const ServerFailure(HttpResponse httpResponse) : super(httpResponse: httpResponse);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(HttpResponse httpResponse) : super(httpResponse: httpResponse);
}
