import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';
import 'package:whatsappu/model/chat%20user%20model.dart';
import 'package:whatsappu/model/likemodel.dart';
import 'package:whatsappu/model/massgemodel.dart';
import 'package:whatsappu/model/postmodel.dart';
import 'package:whatsappu/model/usermodel.dart';
import 'package:whatsappu/module/chat/chat.dart';
import 'package:whatsappu/module/home/homeScreen.dart';
import 'package:whatsappu/module/notfication/notificationScreen.dart';
import 'package:whatsappu/module/profile/profileScreen.dart';
import 'package:whatsappu/module/videoScreen/video.dart';

import 'package:whatsappu/sherdhelper/sherdhelper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class whatsappe extends Cubit<whatsappstates> {
  whatsappe() : super(whatsappinit());
  static whatsappe get(context) => BlocProvider.of(context);
  List<psotmodel>postsmodels = [];
  List<String>postsid = [];
  usermodel? model;
  List<likemodel> liked = [];
  List<chatusermodel>chatusere = [];
  List<masssgemodel>massge=[];
  dynamic indexle;
  String? myhexcolors=sherdprefrence.getdate(key: "mycolor");
  String? therehexcolors=sherdprefrence.getdate(key: "therecolor");
  late dynamic mymassgeC= sherdprefrence.getdate(key: "mycolor")!=null?HexColor("#$myhexcolors"):Colors.black;
  late dynamic theremassgeC=sherdprefrence.getdate(key: "therecolor")!=null?HexColor("#$therehexcolors"):Colors.indigo;
  late String Urlphotocover;
  List<PersistentBottomNavBarItem> bottomNav = [

    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home, color: CupertinoColors.white,),
      title: ("Home"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(

      icon: const Icon(CupertinoIcons.person_alt_circle_fill,color:CupertinoColors.white,),
      title: ("profile"),
      inactiveColorSecondary: Colors.blueGrey,
      activeColorPrimary: Colors.indigo,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: IconButton(
        icon: const Icon(CupertinoIcons.chat_bubble_text_fill), onPressed: () {},),
      title: ("chat"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    /* Icon(
      Icons.home,
      size: 30.0,
    ),
    Icon(
      Icons.notifications,
    ),
    Icon(
      Icons.ondemand_video,
    ),
    Icon(
      Icons.account_circle,
    ),*/
  ];
  List<Widget> screens = [
    home(),
    profile(),
    chat(),
  ];
  int sindex = 0;

  void changeindex(index) {
    sindex = index;
    emit(homechangecurrntnevstate());
  }

  void getuserdata() {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      model = usermodel.fromjson(value.data());
      emit(whatsappgetusersuccses());
    }).catchError((error) {
      print("the error is ${error.toString()}");

      emit(whatsappgetusererror(error.toString()));
    });
  }

  void logout() {
    sherdprefrence.removedate(key: "uid").then((value) {
      emit(whatsappglogout());
      print("done");
    });
  }

/*late File image ;
  Future<void> getphoto() async{
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(pickerprofilesucsses());*/
  // }
  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,

    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      uploudprofile();
      emit((pickerprofilesucsses()));
    } else {
      print('No image selected.');
      emit(pickerprofileerror());
    }
  }

  File? CoverImage;

  Future<void> getcoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,

    );

    if (pickedFile != null) {
      CoverImage = File(pickedFile.path);
      print(pickedFile.path);
      uploudCover();
      emit((pickercoversucsses()));
    } else {
      print('No image selected.');
      emit(pickercovererror());
    }
  }

  String? ProfileImageUrl;

  void uploudprofile() {
    firebase_storage.FirebaseStorage.instance.ref().child('users/profile/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}').putFile(profileImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(" the value of profile is ${value}");
        ProfileImageUrl = value;
        emit(uploadprofilesucsses());
      });
    });
  }

  String? CoverImageUrl;

  void uploudCover() {
    firebase_storage.FirebaseStorage.instance.ref().child('users/cover${Uri
        .file(CoverImage!.path)
        .pathSegments
        .last}').putFile(CoverImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(" the value of cover is ${value}");
        CoverImageUrl = value;
        emit(uploadcoversucsses());
      });
    });
  }

  void updateuserinfo({
    required name,
    required email,
    required bio,
    required phone,
    required urlwall,
  }) {
    emit(updateloding());
    if (CoverImage != null && profileImage != null) {
      print("i will send both");
      user(bio: bio,
          name: name,
          email: email,
          phone: phone,
          cover: CoverImageUrl,
          photo: ProfileImageUrl,
          urlwall:urlwall
      );
    }
    else if (profileImage != null) {
      print("i will send profile");
      user(bio: bio,
          name: name,
          email: email,
          phone: phone,
          cover: model!.cover,
          photo: ProfileImageUrl,
          urlwall:urlwall
      );
    } else if (CoverImage != null) {
      print("i will send cover");
      user(bio: bio,
          name: name,
          email: email,
          phone: phone,
          cover: CoverImageUrl,
          photo: model!.photo,
          urlwall:urlwall
      );
    }
    else {
      print("i will not send thing ");

      user(bio: bio,
          name: name,
          email: email,
          phone: phone,
          cover: model!.cover,
          photo: model!.photo,
          urlwall:urlwall
      );
    }
    print("i will get user data");
    getuserdata();
  }

  void user({
    required name,
    required email,
    required bio,
    required phone,
    required photo,
    required cover,
    required urlwall,
  }) {
    model = usermodel(
      name: name,
      email: email,
      photo: photo,
      cover: cover,
      bio: bio,
      phone: phone,
      uid: uid,
      urlwall: urlwall,
    );
    FirebaseFirestore.instance.collection('users').
    doc(model!.uid).
    update(model!.toMap()).
    then((value) {
      print("i will get user data");
      getuserdata();
    }).
    catchError((errror) {
      emit(updateerror());
    });
  }

  File? postImage;
  File? WALLCAMImage;
  File? WALLImage;
  File? postvideo;
  String? postImageUrl;
  String? wallcamImageUrl;
  String? walltImageUrl;
  String? postvideoUrl;

  var date = DateTime.now();

  Future<void> getpostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,

    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      print(pickedFile.path);
      uploudwall();
      emit((pickercoversucsses()));
    } else {
      print('No image selected.');
      emit(pickpostsucsses());
    }
  }
  Future<void> getwallCAMImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,

    );

    if (pickedFile != null) {
      WALLCAMImage = File(pickedFile.path);
      uploudwall();
      print(pickedFile.path);
      emit((pickercoversucsses()));
    } else {
      print('No image selected.');
      emit(pickpostsucsses());
    }
  }
  Future<void> getwallImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,

    );

    if (pickedFile != null) {
      WALLCAMImage = File(pickedFile.path);
      uploudwall();
      print(pickedFile.path);
      emit((pickercoversucsses()));
    } else {
      print('No image selected.');
      emit(pickpostsucsses());
    }
  }

  Future<void> getpostVideo() async {
    final pickedFile = await picker.pickVideo(
      source: ImageSource.gallery,

    );

    if (pickedFile != null) {
      postvideo = File(pickedFile.path);
      print(pickedFile.path);
      uploudvidopost();
      emit((pickercoversucsses()));
    } else {
      print('No image selected.');
      emit(pickpostsucsses());
    }
  }

  void uploudpost() {
    firebase_storage.FirebaseStorage.instance.ref().child('users/posts${Uri
        .file(postImage!.path)
        .pathSegments
        .last}').putFile(postImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(" the value of cover is ${value}");
        postImageUrl = value;
        emit(uploadimagepostsucsses());
      });
    });
  }
  void uploudwall() {
    firebase_storage.FirebaseStorage.instance.ref().child('users/chats${Uri
        .file(WALLCAMImage!.path)
        .pathSegments
        .last}').putFile(WALLCAMImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(" the value of cover is ${value}");
        wallcamImageUrl = value;
        emit(uploadimagepostsucsses());
      });
    });
  }

  void uploudvidopost() {
    firebase_storage.FirebaseStorage.instance.ref().child('users/posts${Uri
        .file(postvideo!.path)
        .pathSegments
        .last}').putFile(postvideo!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(" the value of cover is ${value}");
        postvideoUrl = value;
        emit(uploadimagepostsucsses());
      });
    });
  }

  void createpost({required text}) {
    idnrate();
    psotmodel?postmodel = psotmodel(
      name: model!.name,
      uid: uid,
      postid: id,
      date: date.toString(),
      Imagephoto: postImageUrl == null ? "" : postImageUrl,
      textpost: text,
      photo: model!.photo,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(postmodel.toMap()
    ).then((value) {
      /* print(value.path.split("posts/").last);
       FirebaseFirestore.instance.collection('posts').
         doc(value.path.split("posts/").last).
     set(postmodel.tolike(value.path.split("posts/").last)).
     then((value)
     {
       emit(likebuld());print("they buld your path");}
       );*/
      print("creat posts");

      emit(uploadpostsucsses());
    }).catchError((error) {
      print(error.toString());
      emit(uploadposterror());
    });
  }

  void deletephoto() {
    postImage = null;

    emit(deletpostphoto());
  }

  void getpostdata() {
    postsmodels.clear();
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      for (var element in value.docs) {
        element.reference.collection('likes').get().then((value) {
          intoflike.add(value.docs.length);
          postsid.add(element.id);
          postsmodels.add(psotmodel.fromjson(element.data()));
        });
      }
      emit(whatsappgetpostssuccses());
    }).catchError((error) {
      print("the error is ${error.toString()}");

      emit(whatsappgetpostserror(error.toString()));
    });
  }

  List intoflike = [];

  void getlikes({index}) {
    liked.clear();
    print("liked");
    FirebaseFirestore.instance.collection('posts').doc(
        postsid[index ?? 1]).collection(
        'likes').get().then((value) {
      for (var element in value.docs) {
        liked.add(likemodel.fromjson(element.data()));
        print(liked);
        emit(whatsappgetlikessuccses());
      }
    }).catchError((error) {
      print(error.toString());
      emit(whatsappgetlikesserror());
    });
  }

  var id;

  void idnrate() {
    for (int i = 0; i < 20; i++) {
      id = const Uuid().v1();
    }
  }

  void makelikepost({required postid, required like}) {
    likemodel?likedmodel = likemodel(
      name: model!.name,
      uid: uid,
      date: date.toString(),
      like: like,
      photo: model!.photo,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('likes')
        .doc(model!.uid).
    set(likedmodel.toMap())
        .then((value) {
      emit(likebuldsucsses());
    }).catchError((Error) {
      print(Error.toString());
      emit(likebulderror());
    });
  }

  void getalluser() {
    chatusere.clear();
    print("chat");
    FirebaseFirestore.instance.collection('users').
    get().then((value) {
      for (var element in value.docs) {
        if (element.data()["uid"] != model!.uid) {
          chatusere.add(chatusermodel.fromjson(element.data()));
        }
        print(chatusere);
        emit(whatsappgetallusersucsses());
      }
    }).catchError((error) {
      print(error.toString());
      emit(whatsappgetallusererror());
    });
  }

  void sendmassge({
    required ressvirid,
    required text,
    required date
  }) {
    masssgemodel massge = masssgemodel(
        date: date,
        myid: model!.uid,
        resrvirid: ressvirid,
        textmassge: text
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(model!.uid)
        .collection("chats")
        .doc(ressvirid)
        .collection("massages")
        .add(massge.toMap())
        .then((value) {
          emit(whatsappsendmassgesucsses());
        }).catchError((error){
          print(error.toString());
          emit(whatsappsendmassgeerror());

    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(ressvirid)
        .collection("chats")
        .doc(model!.uid)
        .collection("massages")
        .add(massge.toMap())
        .then((value) {
      emit(whatsappsendmassgesucsses());
    }).catchError((error){
      print(error.toString());
      emit(whatsappsendmassgeerror());

    });
  }

  void getmassges({required ressvirid }){
    FirebaseFirestore.instance
        .collection("users")
        .doc(model!.uid)
        .collection("chats")
        .doc(ressvirid)
        .collection("massages")
        .orderBy('date')
        .snapshots()
        .listen((event) {
          massge.clear();
       for (var element in event.docs) {
         massge.add(masssgemodel.fromjson(element.data()));
       }
          emit(whatsappgetallmassgesucsses());
    });
  }

  void changecolor(Colors){
       mymassgeC=Colors;
       sherdprefrence.setdate(key: "mycolor", value: mymassgeC.value.toRadixString(16));

       emit(changecolors());
  }
  void changetherecolor(Colors){
      theremassgeC=Colors;
      sherdprefrence.setdate(key: "therecolor", value: theremassgeC.value.toRadixString(16));
      emit(changecolors());
  }
  Stream<FileResponse>? fileStream;

  void downloadFile() {
    const url = 'https://blurha.sh/assets/images/img1.jpg';
      fileStream = DefaultCacheManager().getFileStream(url, withProgress: true);}
  }



