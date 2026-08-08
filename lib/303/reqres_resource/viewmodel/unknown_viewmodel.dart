import 'package:hwa_learn/202/ders12/cache/shared_cachle_learn.dart';
import 'package:hwa_learn/303/reqres_resource/service/unknown_service.dart';
import 'package:hwa_learn/303/reqres_resource/model/unknown_model.dart';
import 'package:hwa_learn/product/services/project_dio.dart';
import '../view/unknown_view.dart';

abstract class UnknownViewModel extends LoadingStates<UnknownView>
    with ProjectDioMixin {
  late final UnknownService unknownService;
  List<Data> resources = [];

  @override
  void initState() {
    unknownService = UnknownService(service);
    super.initState();
  }

  Future<void> fetchUnknownList() async {
    onLoading();
    resources = (await unknownService.fetchUnknownModels()).data ?? [];
    onLoading();
  }
}
