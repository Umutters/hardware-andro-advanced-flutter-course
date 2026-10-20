import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  static String baseUrl = 'https://reqres.in/api/';
  final service = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'x-api-key':
            'pub_2dcc04e3229db57f3296cef4699915e4dc8afa86bc56158e36dc87d4cb13b5db',
      },
    ),
  );
}
