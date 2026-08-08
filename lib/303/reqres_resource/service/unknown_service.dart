import 'package:dio/dio.dart';
import 'package:hwa_learn/303/reqres_resource/model/unknown_model.dart';

abstract class IUnknownService with DioMixin {
  final Dio dio;

  IUnknownService(this.dio);

  Future<UserList> fetchUnknownModels();
}

class UnknownService extends IUnknownService {
  UnknownService(super.dio);

  @override
  Future<UserList> fetchUnknownModels() async {
    try {
      final response = await dio.get(
        'https://reqres.in/api/unknown',
        options: Options(
          headers: {
            'x-api-key':
                'x-api-key: pub_2dcc04e3229db57f3296cef4699915e4dc8afa86bc56158e36dc87d4cb13b5db',
          },
        ),
      );
      if (response.statusCode == 200) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return UserList.fromJson(jsonBody);
        }
      }
      return UserList(data: []);
    } catch (e) {
      // Handle error
      return UserList(data: []);
    }
  }
}
