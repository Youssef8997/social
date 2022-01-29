class usermodel{
String? name;
String? phone;
String? email;
String? uid;
String? photo;
String? cover;
String? bio;
String? urlwall;
usermodel({
    this.email,
    this.phone,
    this.name,
    this.photo,
    this.cover,
    this.bio,
    this.uid,
    this.urlwall,
  });
usermodel.fromjson(Map<String,dynamic>?json){
  email=json!["email"];
  phone=json["phone"];
  name=json["name"];
  photo=json["photo"];
  cover=json["cover"];
  bio=json["bio"];
  uid=json["uid"];
  urlwall=json["urlwall"];
}
Map<String,dynamic>toMap()
{
return {
  'email':email,
  'phone':phone,
  'name':name,
  'photo':photo,
  'cover':cover,
  'bio':bio,
  'uid':uid,
  'urlwall':urlwall,

};
}


}