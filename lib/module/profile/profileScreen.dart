import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';
import 'package:whatsappu/model/postmodel.dart';
import 'package:whatsappu/model/usermodel.dart';
import 'package:whatsappu/module/%20edit%20your%20profile/editProfile.dart';
import 'package:whatsappu/module/videoScreenj/likes.dart';
var w;
var comment=TextEditingController();
class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model= whatsappe.get(context).postsmodels;
    var usermodey= whatsappe.get(context).model;
    var r=MediaQuery.of(context).size.width;
    return BlocConsumer<whatsappe,whatsappstates>(
      listener: (context,state){},
      builder:(context,state){
        var modelk=whatsappe.get(context).model;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 350,
                  child: Stack(

                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter ,
                        child: Container(
                          height:300,
                          width:r,
                          decoration: BoxDecoration(
                            image:DecorationImage(image: NetworkImage("${modelk!.cover}"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadiusDirectional.circular(10.0),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 82.0,
                        child: CircleAvatar(
                          radius: 80.0,
                          backgroundImage:NetworkImage("${modelk.photo}"),
                        ),
                      ),
                    ],)


              ),
              SizedBox(
                width: r,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsetsDirectional.only(top:10,start: 20 ),
                            child: Text("${modelk.name}",style: const TextStyle(fontSize:22.0,fontWeight: FontWeight.bold,),)),
                        Container(
                            padding: const EdgeInsetsDirectional.only(top:10,start: 20 ),
                            child: Text("${modelk.bio} ",style: const TextStyle(fontSize:22.0,fontWeight: FontWeight.w300,),)),
                      ],
                    ),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: (){NEV(context:context,page: editProfile(),bool: true);},child: const Icon(Icons.mode_edit,color:Colors.grey),)
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                color: Colors.grey,
                height: 5,
                width: double.infinity,
              ),
              const SizedBox(height: 15,),
              ConditionalBuilder(
                condition:model.isNotEmpty,
                builder:(context)=>ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>Container(

                    child: card(context,model[index],usermodey!,index),
                  ),
                  separatorBuilder:(context, index)=>Container(height: 10.0,width: double.maxFinite,color: Colors.grey,),
                  itemCount: model.length,
                ),
                fallback:(context)=>const Center(
                    heightFactor: 15,
                    child: CircularProgressIndicator(strokeWidth: 20.0 ,)) ,
              ),


            ],
          ),
        );
      },
    );

  }
}
Widget card(context,psotmodel postmodel,usermodel model,index){
  w=MediaQuery.of(context).size.width;

  if(postmodel.uid==uid){ return Card(
    margin: const EdgeInsetsDirectional.all(13.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(backgroundColor: Colors.blueAccent,radius: 22.0,backgroundImage:NetworkImage("${postmodel.photo}"),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("${postmodel.name}",style: const TextStyle(fontWeight:FontWeight.w900,fontSize:20),),
                      const SizedBox(width: 150.0,),
                      const Icon(Icons.more_horiz),


                    ],
                  ),
                  Row(
                    children: [
                      Text("${postmodel.date} ",style: TextStyle(color: Colors.grey[500],fontSize:15),),
                      const Icon(Icons.public,size: 20,)
                    ],
                  ),


                ],
              )
            ]
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(start: 10),
          width: w,
          child: Text("${postmodel.textpost} ",style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w400),maxLines: 3,
            overflow: TextOverflow.ellipsis,),
        ),
        const SizedBox(height: 5,),
        if(postmodel.Imagephoto!="")
          Container(
            height:370,
            width: w,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("${postmodel.Imagephoto}")

                )
            ),
          ),
        const SizedBox(height: 5,),
        Row(
          children: [
              Row(
                children: [
                  const CircleAvatar(
                    child: Icon(
                      CupertinoIcons.heart,
                      color: Colors.pink,
                    ),
                    radius: 13.0,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: () {
                      whatsappe.get(context).getlikes(index: index);
                      NEV(context: context, page: likes(), bool: true);
                    },
                    child: SizedBox(
                      width: 185,
                      child: Text(
                        "${whatsappe.get(context).intoflike[index]}",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width:55,
                  ),
                  const Text("0 comments")
                ],
              ),


          ],
        ),
        const SizedBox(height: 3,),
        Container(
          height:1,
          width: double.maxFinite,
          color: Colors.black12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              SizedBox(
                  height: 35,
                  width:230,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: comment,
                    decoration:InputDecoration(
                      hintText: "comment......",
                      hintStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize:18
                      ),
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),),),

                  )
              ),

              IconButton(
                icon: const Icon(CupertinoIcons.heart,color: Colors.pink,size:30.0,),
                onPressed: () {  },
              ),
              const SizedBox(width: 10,),
              Container(
                height:20,
                width:1,
                color: Colors.black,
              ),],),
            const SizedBox(width: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.share,color: Colors.indigo,size:30.0,),
                    onPressed: () {  },
                  ),
                ),
                const SizedBox(width: 10,),
              ],),


          ],
        ),

      ],),
  );}
 else
   {return const SizedBox(height: .1,);

   }
}
