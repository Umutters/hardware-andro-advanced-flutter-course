//dartta initialize etmek gerekir değişkenleri class içinde

class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
 final  int userId;
 final int id;
 final String title;
 final String body;
  PostModel2(this.body, this.id, this.title, this.userId);
}

class postModel3 {
  int userId;
  int id;
  String title;
  String body;
  postModel3(this.body, this.id, this.title, this.userId);
}

class PostModel4 {
  int userId;
  int id;
  String title;
  String body;
  PostModel4(
      {required this.body,
      required this.id,
      required this.title,
      required this.userId});
}
class postModel5{
  final int _userId;
  final int _id;
  final String _title;
  final String _body;
  postModel5(
    {required int UserId, required int Id, required String Title, required String Body})
      {  _userId = UserId,
        int _id = Id,
        String _title = Title,
        String _body = Body;
      }
}
