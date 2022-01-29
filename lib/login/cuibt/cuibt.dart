
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappu/login/cuibt/states.dart';
import 'package:whatsappu/model/usermodel.dart';
import 'package:whatsappu/sherdhelper/sherdhelper.dart';


class cuibtwhats extends Cubit<whatsappshopappstate>{
  cuibtwhats() : super(whatsappshopappstateinis());
  static cuibtwhats get(context)=>BlocProvider.of(context);
  bool isobes=true;

  void userwhatsappg({required email,required password,required phone ,required name, uid}) {
    emit(whatsappshopappstateloding());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then(
            (value) {
              print(value.user!.email);
              print(value.user!.uid);
              sherdprefrence.setdate(key: "uid", value: value.user!.uid);
              create(email: email,name:name,phone: phone,uid:value.user!.uid);
            }
    ).catchError((onError)
    {    emit(whatsappshopappstateerror());
    }
    );
  }

  void create({required email,required phone ,required name,required uid,urlwall="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBG9y9sFMLv3hLQTJUwOzwEjn_Or9wQPBDjA&usqp=CAU",photo,cover,bio}){
    usermodel?useremodel=usermodel(name: name,
      email: email,
      photo: photo,
      cover: cover,
      bio: bio,
    phone: phone,
      uid: uid,
      urlwall:"",
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(
        useremodel.toMap()
    ).then((value) {
      print("creat userr");
      emit(whatsappusercarshopappstatesucsses());
    }).catchError((error){
      print(error.toString());
      email(whatsappsusercarhopappstateerror(error.toString()));
    });
  }
  void userloging({required email,required password}){
    emit(whatsapploginshopappstateloding());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then(
            (value) {
          print(value.user!.email);
          print(value.user!.uid);
          sherdprefrence.setdate(key: "uid", value: value.user!.uid);
          emit(whatsapploginshopappstatesucsses());
        }
    ).catchError((onError)
    {    emit(whatsappsloginhopappstateerro(onError));
    }
    );
  }


  void obserd(){
    isobes= !isobes;
    emit(changeobserved());

  }
}


