import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hwa_learn/202/ders8/model/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  late final user5;
  late PostModel8 user8;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user1 = PostModel1();
    user1.body = "body";
    user1.id = 1;
    user1.title = "title";
    user1.userId = 10;
    final user2 = PostModel1()
      ..userId = 1
      ..id = 2
      ..title = "title2"
      ..body = "body2";
    final user3 = PostModel2("body3", 3, "title3", 3);
    user3.title = 'a';
    final user4 = postModel3("body4", 4, "title4", 4);
    // hata alıyoruz çünkü final var user4.title='b';
    user5 = PostModel4(body: "body5", id: 5, title: "title5", userId: 5);
    final user6 = PostModel5(userId: 6, id: 6, title: "title6", body: "body6");
    final user7 = postModel6(7, 7, "title7", "body7");
    user8 = PostModel8(body: "body8", id: 8, title: "title8", userId: 8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(user8.body ?? "")),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Text("aa gese"),
            onPressed: () {
              setState(() {
                user8.body = user8.updateBody("ananın amı gese");
              });
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Text("aa febe"),
            onPressed: () {
              setState(() {
                user8.body = user8.updateBody("ananın amı febe");
              });
            },
          ),
        ],
      ),
    );
  }
}
