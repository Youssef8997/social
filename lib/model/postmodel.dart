class psotmodel{
  String? name;
  String? uid;
  String? postid;
  String? date;
  String? textpost;
  String? Imagephoto;
  String? photo;

  psotmodel({
    this.name,
    this.Imagephoto,
    this.photo,
    this.textpost,
    this.date,
    this.uid,
    this.postid,
  });
  psotmodel.fromjson(Map<String,dynamic>?json){
    name=json!["name"];
    Imagephoto=json["Imagephoto"];
    photo=json["photo"];
    textpost=json["textpost"];
    date=json["date"];
    uid=json["uid"];
    postid=json["postid"];
  }
  Map<String,dynamic>toMap()
  {
    return {

      'name':name,
      'Imagephoto':Imagephoto,
      'photo':photo,
      'textpost':textpost,
      'date':date,
      'uid':uid,
      'postid':postid,

    };
  }



}