import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/login/cuibt/cuibt.dart';
import 'package:whatsappu/login/cuibt/states.dart';
import 'package:whatsappu/homelayout/whatsapplayout.dart';

class regster extends StatelessWidget {
  var namecontrolar=TextEditingController();
  var emailcontrolar=TextEditingController();
  var passwordcontrolar=TextEditingController();
  var phonecontrolar=TextEditingController();
  var keyregs=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cuibtwhats,whatsappshopappstate>(
      listener: (context,state){
        if (state is whatsappshopappstatesucsses) {
          NEV(context: context,page:whatsapp() );

        }
      },
      builder: (context,state){
        var mm=cuibtwhats.get(context);
        return Scaffold(
          appBar: AppBar(),
          body:Padding(
            padding: const EdgeInsets.all(40.0),
            child:   SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child:   Form(
                  key:keyregs,
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const CircleAvatar(radius: 50.0,
                              backgroundImage:
                              NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg")),
                           CircleAvatar(child: const Icon(Icons.add_a_photo_rounded),radius: 18.0,backgroundColor:Colors.grey[300],foregroundColor: Colors.black,),

                        ],
                      ),
                      const SizedBox(height: 50.0,),
                      textform(label: "first name", icon: const Icon(Icons.badge), controlar: namecontrolar),
                      const SizedBox(height: 20.0,),
                      textform(label: "email", icon: const Icon(Icons.email_outlined), controlar:emailcontrolar,type: TextInputType.emailAddress),
                      const SizedBox(height: 20.0,),
                      textform(label: "password", icon:const  Icon(Icons.lock), controlar:passwordcontrolar,suficon: const Icon(Icons.visibility)),
                      const  SizedBox(height: 20.0,),
                      textform(label: "phone number", icon:const  Icon(Icons.phone), controlar: phonecontrolar,type:const TextInputType.numberWithOptions()),
                      const SizedBox(height: 20.0,),
                      MaterialButton(onPressed: (){
                        if(keyregs.currentState!.validate())
                        mm.userwhatsappg(email: emailcontrolar.text,password:passwordcontrolar.text,phone: phonecontrolar.text,name: namecontrolar.text );

                      },

                        child: const Text("SAVE"),)

                    ],

                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }}




