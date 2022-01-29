class likemodel{
  String? name;
  String? uid;
  String? date;
  String? photo;
  bool?like;
  likemodel({
    this.name,
    this.photo,
    this.date,
    this.uid,
    this.like,
  });
  likemodel.fromjson(Map<String,dynamic>?json){
    name=json!["name"];
    photo=json["photo"];
    like=json["like"];
    date=json["date"];
    uid=json["uid"];

  }
  Map<String,dynamic>toMap()
  {
    return {
      'name':name,
      'photo':photo,
      'like':like,
      'date':date,
      'uid':uid,
    };
  }



}