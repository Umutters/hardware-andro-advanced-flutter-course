import 'package:flutter/material.dart';
import 'package:hwa_learn/303/reqres_resource/model/unknown_model.dart';
import 'package:hwa_learn/303/reqres_resource/service/unknown_provider.dart';
import 'package:hwa_learn/303/reqres_resource/service/unknown_service.dart';
import 'package:hwa_learn/303/reqres_resource/viewmodel/unknown_viewmodel.dart';
import 'package:hwa_learn/product/global/theme_notifier.dart';
import 'package:hwa_learn/product/services/project_dio.dart';
import 'package:provider/provider.dart';

class UnknownView extends StatefulWidget {
  const UnknownView({super.key, required this.message});

  final String message;

  @override
  State<UnknownView> createState() => _UnknownViewState();
}

//class _UnknownViewState extends UnknownViewModel {
class _UnknownViewState extends State<UnknownView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UnknownProvider>(
      create: (context) => UnknownProvider(UnknownService()),
      builder: (context, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          },
        ),
        appBar: AppBar(
          title: context.watch<UnknownProvider>().isLoading
              ? const CircularProgressIndicator()
              : null,
        ),
        body: Column(
          children: [
            Selector<UnknownProvider, bool>(
              selector: (context, provider) => provider.isLoading,
              builder: (context, isLoading, child) {
                return isLoading
                    ? const CircularProgressIndicator()
                    : const Placeholder();
              },
            ),

            Expanded(
              child: _ResourcelistView(
                context.watch<UnknownProvider>().resources,
                context,
              ),
            ),
          ],
        ),
      ),

      // appBar: AppBar(
      //   title: isLoading ? const CircularProgressIndicator() : null,
      // ),
      // body: ListView.builder(
      //   itemCount: resources.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(resources[index].name ?? ''),
      //       subtitle: Text(resources[index].year?.toString() ?? ''),
      //       leading: CircleAvatar(
      //         backgroundColor: resources[index].colorValue != 0xFFFFFFFF
      //             ? Color(resources[index].colorValue)
      //             : Colors.grey,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

ListView _ResourcelistView(List<Data> resources, BuildContext context) {
  return ListView.builder(
    itemCount: resources.length,
    itemBuilder: (context, index) {
      final resource = resources[index];
      return ListTile(
        title: Text(resource.name ?? ''),
        subtitle: Text(resource.year?.toString() ?? ''),
        leading: CircleAvatar(
          backgroundColor: resource.colorValue != 0xFFFFFFFF
              ? Color(resource.colorValue)
              : Colors.grey,
        ),
      );
    },
  );
}
