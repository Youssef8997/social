
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/login/Login.dart';
import 'package:whatsappu/login/cuibt/cuibt.dart';
import 'package:whatsappu/sherdhelper/sherdhelper.dart';
import 'package:whatsappu/spalsh%20screen/spalsh.dart';
import 'homelayout/whatsapplayout.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("onbackground");
  showtoast(color: Colors.green,msg: "onbackground");
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token=await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.onMessage.listen((event) {
    print(event.notification!.title.toString());
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.notification!.title.toString());
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await sherdprefrence.init();
   uid= sherdprefrence.getdate(key: "uid");
   dynamic bord=sherdprefrence.getdate(key: "onbord");
  Widget? widget;
  if(bord==null){
    widget=start();
  }else if(uid==null)
  {
    widget = Login();
  }
  else{
    widget=whatsapp();
  }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
final widget;
MyApp(this.widget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider
        (
        create: (BuildContext context)=>cuibtwhats()),

        BlocProvider(
            create: (BuildContext context)=>whatsappe()..getuserdata()..getpostdata()),

        BlocProvider(
            create: (BuildContext context)=>cuibtwhats()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
                       primarySwatch: Colors.indigo,

              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarContrastEnforced: true,
                  systemStatusBarContrastEnforced: true,
                  statusBarColor: Colors.white,
                  systemNavigationBarColor:Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.dark,

                ),
                color: Colors.white,
                elevation:0,

                centerTitle: true,


              ),

          ),
darkTheme: ThemeData(
  backgroundColor: Colors.black26,
scaffoldBackgroundColor: Colors.black87,
    brightness:Brightness.dark,
  cardColor: Colors.black87,
  iconTheme: IconThemeData(
    color: Colors.indigo
  )
),
          home:widget
      ),
    );

  }
}


