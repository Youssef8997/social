
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';
import 'package:whatsappu/model/chat%20user%20model.dart';
import 'package:whatsappu/model/postmodel.dart';
import 'package:whatsappu/module/chat/personChat.dart';

class chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    whatsappe.get(context).getalluser();
    return BlocConsumer<whatsappe, whatsappstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var postmodel = whatsappe.get(context).chatusere;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "chats",
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700),
            ),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index)=>chate(postmodel[index],context),
                      separatorBuilder: (context,index)=>const SizedBox(height: 50,),
                      itemCount: postmodel.length
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget chate(chatusermodel postmodel,context) {
    return InkWell(
      onTap: (){
        whatsappe.get(context).getmassges(ressvirid: postmodel.uid);
        NEV(page:personalchat(postmodel),context: context,bool:true  );},
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 30,
          backgroundImage: NetworkImage("${postmodel.photo}"),
        ),
        const SizedBox(width:5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Row(
              children: [
                Text(
                  "${postmodel.name}",
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),


              ],
            ),

          ],
        )
      ]),
    );
  }
}
