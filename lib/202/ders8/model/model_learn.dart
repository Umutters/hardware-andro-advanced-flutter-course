//dartta initialize etmek gerekir değişkenleri class içinde

class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;
  PostModel2(this.body, this.id, this.title, this.userId);
}

class postModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;
  postModel3(this.body, this.id, this.title, this.userId);
}

class PostModel4 {
  int userId;
  int id;
  String title;
  String body;
  PostModel4({
    required this.body,
    required this.id,
    required this.title,
    required this.userId,
  });
}

class postModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;
  /*
    int? _userId;
    int? _id;
    String? _title;
    String? _body;
   */
  /*postModel5({required int UserId, required int Id, required String Title, required String Body})
      {  _userId = UserId;
         _id = Id;
         _title = Title;
         _body = Body;
      }*/
  postModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : _userId = userId,
       _id = id,
       _title = title,
       _body = body;
}

class postModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;
  /*
    int? _userId;
    int? _id;
    String? _title;
    String? _body;
   */
  postModel6(int UserId, int Id, String Title, String Body) {
    _userId = UserId;
    _id = Id;
    _title = Title;
    _body = Body;
  }
  //postModel5({required int userId, required int id, required String title, required String body}):_userId=userId, _id=id, _title=title, _body=body;
}

class postModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  postModel8({
    required this.body,
    required this.id,
    required this.title,
    required this.userId,
  });
  void changeBody(String? data) {
    if (data != null && data.isNotEmpty) {
      //body=data; final olduğu için değiştirilemiyor
      body = data;
    }
  }

  postModel8 copyWith({int? userId, int? id, String? title, String? body}) {
    return postModel8(
      body: body ?? this.body,
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
    );
  }
}
