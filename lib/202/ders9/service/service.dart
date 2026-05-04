import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hwa_learn/202/ders9/service/comments_model.dart';

abstract class ICommentService {
  Future<List<CommentsModel>?> fetchPostItemsAdvanced();
  Future<bool> sendPostItems(CommentsModel model);
  Future<bool> deleteServiceItem(int id);
  Future<bool> updateServiceItem(int id, CommentsModel model);
}

class CommentService implements ICommentService {
  final Dio _dio;
  CommentService()
    : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<List<CommentsModel>?> fetchPostItemsAdvanced() async {
    try {
      final response = await _dio.get('comments');

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => CommentsModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('hata {$e.}');
    }
    return null;
  }

  @override
  Future<bool> sendPostItems(CommentsModel model) async {
    try {
      final response = await _dio.post('comments', data: model);
      return response.statusCode == HttpStatus.created;
    } catch (_) {
      print('hata');
    }
    return false;
  }

  @override
  Future<bool> deleteServiceItem(int id) async {
    try {
      // Most APIs use 'comments/$id'
      final response = await _dio.delete('comments/$id');

      // Check for 200 (OK) or 204 (No Content)
      return response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.noContent;
    } on DioException catch (e) {
      // Log specific Dio errors for debugging
      print('Delete failed: ${e.response?.statusCode} - ${e.message}');
      return false;
    } catch (e) {
      print('Unexpected error: $e');
      return false;
    }
  }

  @override
  Future<bool> updateServiceItem(int id, CommentsModel model) async {
    try {
      final response = await _dio.put('comments/$id', data: model);
      return response.statusCode == HttpStatus.ok;
    } catch (e) {
      print('hata {$e.}');
    }
    return false;
  }
}
