import 'package:flutter/material.dart';
import 'package:hwa_learn/303/reqres_resource/model/unknown_model.dart';
import 'package:hwa_learn/303/reqres_resource/service/unknown_service.dart';
import 'package:hwa_learn/product/global/unknown_context.dart';

class UnknownProvider extends ChangeNotifier {
  late final UnknownService unknownService;
  List<Data> resources = [];
  bool isLoading = false;
  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  UnknownProvider(this.unknownService) {
    fetchUnknownList();
  }

  Future<void> fetchUnknownList() async {
    changeLoading();
    resources = (await unknownService.fetchUnknownModels()).data ?? [];
    changeLoading();
  }

  void saveToLocale(UnknownContext context) {
    context.saveModel(UserList(data: resources));
  }
}
