class User {
  int? id;
  String? fname;
  String? lname;
  String? phone;
  String? image;
  String? email;
  String? token;

  User({
    this.id,
    this.fname,
    this.lname,
    this.phone,
    this.image,
    this.email,
    this.token
  });


  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['user']['id'],
      fname: json['user']['fname'],
      lname: json['user']['lname'],
      phone: json['user']['phone'],
      image: json['user']['image'],
      email: json['user']['email'],
      token: json['token']
    );
  }
}