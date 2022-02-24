class User {
  String? role;
  bool? isEmailVerified;
  String? name;
  String? email;
  String? id;

  User({this.role, this.isEmailVerified, this.name, this.email, this.id});

  User.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    isEmailVerified = json['isEmailVerified'];
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['isEmailVerified'] = isEmailVerified;
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
