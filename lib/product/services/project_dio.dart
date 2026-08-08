import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final service = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: 'https://reqres.in/api/unknown',
      headers: {
        'x-api-key':
            'x-api-key: pub_2dcc04e3229db57f3296cef4699915e4dc8afa86bc56158e36dc87d4cb13b5db',
      },
    ),
  );
}
