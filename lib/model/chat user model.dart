class chatusermodel{
  String? name;
  String? uid;
  String? photo;
  chatusermodel({
    this.name,
    this.photo,
    this.uid,
  });
  chatusermodel.fromjson(Map<String,dynamic>?json){
    name=json!["name"];
    photo=json["photo"];
    uid=json["uid"];
  }
  Map<String,dynamic>toMap()
  {
    return {
      'name':name,
      'photo':photo,
      'uid':uid,
    };
  }


}