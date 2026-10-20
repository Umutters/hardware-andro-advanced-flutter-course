import 'dart:developer';

import 'package:hwa_learn/303/reqres_resource/model/unknown_model.dart';
import 'package:hwa_learn/product/services/project_dio.dart';

abstract class IUnknownService with ProjectDioMixin {
  Future<UserList> fetchUnknownModels();
}

class UnknownService extends IUnknownService {
  @override
  Future<UserList> fetchUnknownModels() async {
    try {
      final response = await service.get('unknown');
      inspect(response);
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
