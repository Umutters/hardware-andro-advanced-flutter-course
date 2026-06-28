class UserModel {
  String? name;
  String? description;
  String? url;

  UserModel({this.name, this.description, this.url});

  UserModel.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      description = json['description'],
      url = json['url'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description, 'url': url};
  }
}
