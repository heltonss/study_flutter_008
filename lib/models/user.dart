class User {
  int? id;
  String name;
  String username;
  String? password;
  String? token;

  User(this.id, this.name, this.username, this.password);

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     name: json['name'],
  //     username: json['username'],
  //     password: json['password'],
  //   );
  // }

//   User.fromJson(dynamic obj):
//     id

  User.fromObject(dynamic obj)
      : id = obj['id'],
        name = obj['name'],
        username = obj['username'],
        password = obj['password'],
        token = obj['token'];

  dynamic toObject() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'token': token,
    };
  }
}
