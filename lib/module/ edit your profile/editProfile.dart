
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';

class editProfile extends StatefulWidget {
  @override
  State<editProfile> createState() => _editProfileState();


}

class _editProfileState extends State<editProfile> {
 @override

 var namecontrolare;
 var biocontrolare;
 var phonecontoralre;
 var modelk;
 @override
  Future<void> initState() async {
   phonecontoralre=TextEditingController();
   namecontrolare=TextEditingController();
   biocontrolare=TextEditingController();
   modelk=whatsappe.get(context).model;
   namecontrolare.text="${modelk!.name}";
   biocontrolare.text="${modelk!.bio}";
   phonecontoralre.text="${modelk!.phone}";

  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<whatsappe,whatsappstates>
      (listener:(context,state){},
        builder:(context,state){
          var r=MediaQuery.of(context).size.width;
        dynamic profileImage=whatsappe.get(context).profileImage;
        dynamic coverImage=whatsappe.get(context).CoverImage;

          return Scaffold(
          appBar: AppBar(
              leading: IconButton(onPressed: (){Navigator.pop(context);}
                ,icon:const Icon(Icons.arrow_back_ios,color: Colors.black,) ,),
              centerTitle: true,
              title: const Text("EDIT YOUR PROFILE",style:  TextStyle(color: Colors.black),),
            actions: [IconButton(onPressed: (){whatsappe.get(context).updateuserinfo(phone:phonecontoralre.text ,email:modelk!.email ,name: namecontrolare.text ,bio: biocontrolare.text,urlwall:"" );}, icon:const Icon(Icons.done,color: Colors.blue,))],

          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if(state is updateloding)
                 /* LiquidLinearProgressIndicator(
                  value: 0.8, // Defaults to 0.5.
                  valueColor: AlwaysStoppedAnimation(Colors.pink), // Defaults to the current Theme's accentColor.
                  backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
                  borderColor: Colors.red,
                  borderWidth: 5.0,
                  borderRadius: 12.0,
                  direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                  center: Text("Loading..."),
            ),*/
                  const LinearProgressIndicator(minHeight: 15,),
                SizedBox(
                    height: 350,
                    child: Stack(

                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter ,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                height:300,
                                width:r,
                                decoration: BoxDecoration(
                                  image:DecorationImage(image:coverImage==null?NetworkImage("${modelk!.cover}"):FileImage(coverImage)as ImageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadiusDirectional.circular(10.0),
                                ),
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.white70,
                                  radius: 20,
                                  child: IconButton(onPressed: (){
                                    whatsappe.get(context).getcoverImage();
                                  }, icon:const Icon(Icons.add_a_photo_rounded,color: Colors.black,)))
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 82.0,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 80.0,
                                backgroundImage:profileImage==null?NetworkImage("${modelk!.photo}"):FileImage(profileImage)as ImageProvider
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 20,
                                  child: IconButton(onPressed: (){
                                    whatsappe.get(context).getProfileImage();

                                    }, icon:const Icon(Icons.add_a_photo_rounded,color: Colors.black,))),
                            ],
                          ),
                        ),
                      ],)


                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: namecontrolare,
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value!.isEmpty){
                      return "name must not be empty ";
                    }
                    return null ;
                  },

                  decoration:InputDecoration(
                    prefixIcon: const Icon(Icons.person,color: Colors.black,),
                  label: const Text("name"),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),),

                ),
                const SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.text,

validator: (value){
                    if(value!.isEmpty){
                      return "bio must not be empty ";
                    }
                    return null ;
},
                  controller: biocontrolare,
                  decoration:InputDecoration(
                    prefixIcon: const Icon(Icons.person,color: Colors.black,),
                    label: const Text("bio"),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),),

                ),
                const SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.phone,

                  validator: (value){
                    if(value!.isEmpty){
                      return "phone must not be empty ";
                    }
                    return null ;
                  },
                  controller: phonecontoralre,
                  decoration:InputDecoration(
                    prefixIcon: const Icon(Icons.phone,color: Colors.black,),
               label:const Text("phone"),

                    fillColor: Colors.grey,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),),

                ),
              ],
            ),
          ),
        );
        });
  }
}
