class masssgemodel{
  String? textmassge;
  String? myid;
  String? resrvirid;
  String? date;
  masssgemodel({
    this.textmassge,
    this.resrvirid,
    this.myid,
    this.date,
  });
  masssgemodel.fromjson(Map<String,dynamic>?json){
    textmassge=json!["textmassge"];
    resrvirid=json["resrvirid"];
    myid=json["myid"];
    date=json["date"];
  }
  Map<String,dynamic>toMap()
  {
    return {
      'textmassge':textmassge,
      'resrvirid':resrvirid,
      'myid':myid,
      'date':date,
    };
  }


}