class User {
  int? id;
  String? username;
  String? name;
  String? email;
  String? password;

  User(
      {this.id,
      this.username,
      this.name,
      this.email,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
