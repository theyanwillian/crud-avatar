class User {
  String? id;
  String? name;
  String? email;
  String? avatarUrl;

  User({this.id, this.name, this.email, this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["token"],
    name: json["name"],
    email: json["email"],
    avatarUrl: json["avatarUrl"],
  );
}