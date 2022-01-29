import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';

class Newpost extends StatelessWidget {
  var Newposte=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var r=MediaQuery.of(context).size.width;

    return BlocConsumer<whatsappe,whatsappstates>
      (listener: (context,state){},
        builder: (context,state){
          var image=whatsappe.get(context).postImage;
        return Scaffold(
          appBar:AppBar(

            centerTitle: true,
            title: const Text("newpost",style:  TextStyle(color: Colors.black,fontWeight:FontWeight.bold ),),
            leading: IconButton(onPressed: (){Navigator.pop(context);whatsappe.get(context).deletephoto();}
              ,icon:const Icon(Icons.arrow_back_ios,color: Colors.black,) ,),
            actions: [IconButton(onPressed: (){whatsappe.get(context).createpost( text: Newposte.text); Navigator.pop(context);image=null;whatsappe.get(context).deletephoto();whatsappe.get(context).getpostdata();}, icon: const Icon(Icons.done,color: Colors.black,))],
          ),
          body:SingleChildScrollView(
            physics:const BouncingScrollPhysics( ),
            padding: const EdgeInsetsDirectional.only(top:15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.blueAccent,radius:35.0,backgroundImage:NetworkImage
                        ("${whatsappe.get(context).model!.photo}"),

                      ),
                      const SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                               Text("youssef ahmed",style: TextStyle(fontWeight:FontWeight.w900,fontSize:20),),
                               SizedBox(width: 5.0,),
                               Icon(Icons.public,size: 20,)


                            ],
                          ),





                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: Newposte,
                    decoration:InputDecoration(
                      hintText: "what is on your mind?",
                      hintStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize:18
                      ),
                      fillColor: Colors.grey,
                      border: InputBorder.none,

                    ),
                  ),
                ),
                if(image!=null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height:370 ,
                      width: r,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: FileImage(image!),fit: BoxFit.fill),
                        color: Colors.black
                      ),
                    ),
                    IconButton(onPressed: (){whatsappe.get(context).deletephoto();}, icon:const Icon(Icons.clear,size: 28.0,))
                  ],
                ),
                if(image==null)
                  const SizedBox(height:350 ,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: (){whatsappe.get(context).getpostImage();},
                          child: Row(
                            children: const [
                              Icon(
                                Icons.photo,size: 25,
                              ),
                              Text("add photo",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    
                   
                    ],
                  ),
                ),

              ],
            ),
          ) ,
        );
        }
    );
  }
}
