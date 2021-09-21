class CreateUsersModel{
  String? email;
  String? name;
  String? phone;
  String? uid;
  String? password;
  String? image;
  String? cover;
  String? bio;


  CreateUsersModel({
    this.uid,
    this.email,
    this.phone,
    this.name,
    this.password,
    this.image,
    this.cover,
    this.bio,
});

  CreateUsersModel.fromJson(Map<String,dynamic> json){
    email=json["email"];
    name=json["name"];
    phone=json["phone"];
    uid=json["uid"];
    password=json["password"];
    image=json["image"];
    cover=json["cover"];
    bio=json["bio"];
  }
  Map<String,dynamic> usersMap(){
    return {
      "email":email,
      "name":name,
      "phone":phone,
      "uid":uid,
      "password":password,
      "image":image,
      "cover":cover,
      "bio":bio,
    };
  }
}