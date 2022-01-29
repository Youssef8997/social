import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';
import 'package:whatsappu/model/chat%20user%20model.dart';
import 'package:whatsappu/model/massgemodel.dart';

import 'package:whatsappu/module/chat/chatSettings.dart';

var kaypost = const Key("postined");
var kayLIST = const Key("LISTVIEW");
var chatfield = TextEditingController();

class personalchat extends StatefulWidget {
  chatusermodel model;
  personalchat(this.model);

  @override
  State<personalchat> createState() => _personalchatState();
}

class _personalchatState extends State<personalchat> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<whatsappe, whatsappstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cuibt = whatsappe.get(context);
        var size = MediaQuery
            .of(context)
            .size;
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [HexColor("#052053"), Colors.black])),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("${widget.model.photo}"),
                  radius: 25.0,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "${widget.model.name}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    NEV(context: context, page: ChatSittings(), bool: true);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
            ],
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: cuibt.model!.urlwall == null
                              ? const NetworkImage(
                              "https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/237359212_3027063007563604_1694618086222632486_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=Zc5QUGQ8zb8AX-QSXUg&tn=u0Le_z7Ck5koXV6e&_nc_ht=scontent.fcai20-1.fna&oh=00_AT8XQKrwXOQCjsMYWF1cGk3LzOMV1G-CQbH1V9M1RtMhGw&oe=61F006BD")
                              : NetworkImage(cuibt.model!.urlwall!),
                          isAntiAlias: false,
                          fit: BoxFit.fill))),
              ConditionalBuilder(
                condition: widget.model.uid == widget.model.uid,
                builder: (context) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 17),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          key: kayLIST,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var id = cuibt.model!.uid;
                            if (cuibt.massge[index].myid == id) {
                              return buildmymassge(
                                cuibt.massge[index],
                              );
                            }
                            return buildmassge(cuibt.massge[index]);
                          },
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                                height: 10.0,
                              ),
                          itemCount: cuibt.massge.length),
                    ),
                fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.only(bottom: 15, top: 0),
                child: Row(
                  children: [
                    SizedBox(
                      width:size.width-60,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: chatfield,
                        decoration: InputDecoration(
                          hintText: "write your massge ......",
                          hintStyle: TextStyle(
                              color: Colors.grey[700], fontSize: 18),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(20.0),
                            color: Colors.grey[350]),
                        child: MaterialButton(
                          onPressed: () {
                            cuibt.sendmassge(
                                ressvirid: widget.model.uid,
                                text: chatfield.text,
                                date: DateTime.now().toString());
                            chatfield.text = "";
                          },
                          child: const Icon(
                            Icons.send,
                            color: Colors.indigo,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          minWidth: 30,
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildmassge(masssgemodel model) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            decoration: BoxDecoration(
                color: whatsappe
                    .get(context)
                    .theremassgeC,
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(25.0),
                  bottomEnd: Radius.circular(25.0),
                  bottomStart: Radius.circular(20.0),
                )),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: [
                Text(
                  "${model.textmassge}  ",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildmymassge(masssgemodel model,) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Container(
            decoration: BoxDecoration(
                color: whatsappe
                    .get(context)
                    .mymassgeC,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(25.0),
                  bottomEnd: Radius.circular(20.0),
                  bottomStart: Radius.circular(25.0),
                )),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${model.textmassge} ",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      );
}
