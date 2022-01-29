// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';
import 'package:whatsappu/model/likemodel.dart';
import 'package:whatsappu/model/postmodel.dart';
import 'package:whatsappu/model/usermodel.dart';
import 'package:whatsappu/module/NewPost/Newpost.dart';
import 'package:whatsappu/module/videoScreenj/likes.dart';

class home extends StatelessWidget {
  var w;
  var newpost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    //whatsappe()..getlikes();
    return BlocConsumer<whatsappe, whatsappstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = whatsappe.get(context).postsmodels;
        var usermodey = whatsappe.get(context).model;
        var likes = whatsappe.get(context).liked;
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "home",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    ;
                  },
                  icon:

                  const Icon(CupertinoIcons.search_circle),

                  color: Colors.black,
                  splashRadius: 25.0,
                ),
                radius: 20.0,
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(
                width: 3,
              ),

            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22.0,
                        backgroundImage: NetworkImage("${usermodey!.photo}"),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                          height: 45,
                          width: w - 74,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: newpost,
                            onTap: () {
                              NEV(
                                  bool: true,
                                  context: context,
                                  page: Newpost());
                            },
                            decoration: InputDecoration(
                              hintText: "what is on your mind?",
                              hintStyle: TextStyle(
                                  color: Colors.grey[700], fontSize: 18),
                              fillColor: Colors.grey,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                ConditionalBuilder(
                  condition:
                      model.isNotEmpty && model != null && usermodey != null,
                  builder: (context) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        card(context, model[index], usermodey, index),
                    separatorBuilder: (context, index) => Container(
                      height: 10.0,
                      width: double.maxFinite,
                      color: Colors.grey,
                    ),
                    itemCount: model.length,
                  ),
                  fallback: (context) => const Center(
                      heightFactor: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 20.0,
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget card(
    context,
    psotmodel postmodel,
    usermodel model,
    index,
  ) {
    w = MediaQuery.of(context).size.width;
    return Card(
      margin: const EdgeInsetsDirectional.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 25.0,
              backgroundImage: NetworkImage("${postmodel.photo}"),
            ),
            const SizedBox(width: 4,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2,),
                Row(
                  children: [
                    Text(
                      "${postmodel.name}",
                      style:
                      const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${postmodel.date} ",
                      style: TextStyle(color: Colors.grey[500], fontSize: 15),
                    ),

                  ],
                ),
              ],
            )
          ]),
          const SizedBox(height: 8,),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 10),
            width: w,
            child: Text(
              "${postmodel.textpost} ",
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (postmodel.Imagephoto != "")
            Container(
              height: 370,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${postmodel.Imagephoto}"))),
            ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              //if(whatsappe.get(context).liked[index]!=0)
              Row(
                children: const [
                  /*CircleAvatar(child: Icon(Icons.favorite,color: Colors.white,),radius: 14.0,backgroundColor: Colors.red,),
                  SizedBox(width: 2,),*/
                  CircleAvatar(
                    child: Icon(
                      CupertinoIcons.heart,
                      color: Colors.pink,
                    ),
                    radius: 13.0,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                width: 3,
              ),
              //if(whatsappe.get(context).liked[index]!=0)
              Expanded(
                child: InkWell(
                  onTap: () {
                    whatsappe.get(context).getlikes(index: index);
                    NEV(context: context, page: likes(), bool: true);
                  },
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      "${whatsappe.get(context).intoflike[index]}",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800]),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 1,
            width: double.maxFinite,
            color: Colors.black12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 35,
                      width: 230,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: newpost,
                        decoration: InputDecoration(
                          hintText: "comment......",
                          hintStyle: TextStyle(
                              color: Colors.grey[700], fontSize: 18),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      )),
                  IconButton(
                     icon: const Icon(
                      CupertinoIcons.heart,
                      color: Colors.pink,
                    ),
                    onPressed: () {
                      whatsappe.get(context).makelikepost(
                          postid: whatsappe.get(context).postsid[index],
                          like: true);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.share,
                        color: Colors.indigo,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget fallBack(context) {
    var o = MediaQuery.of(context).size.height;
    return SizedBox(
      height: o,
      width: double.maxFinite,
      child: Column(
        children: [
          LiquidCircularProgressIndicator(
            value: 0.5,
            // Defaults to 0.5.
            valueColor: const AlwaysStoppedAnimation(Colors.pink),
            // Defaults to the current Theme's accentColor.
            backgroundColor: Colors.white,
            // Defaults to the current Theme's backgroundColor.
            borderColor: Colors.red,
            borderWidth: 5.0,

            direction: Axis.horizontal,
            // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
            center: const Text("Loading..."),
          )
        ],
      ),
    );
  }
}

Widget dialog(likemodel kmodel) {
  return Row(
    children: [
      CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 22.0,
          backgroundImage: NetworkImage("${kmodel.photo}")),
      Text("${kmodel.name}"),
      const Spacer(),
      const Icon(
        Icons.thumb_up,
        color: Colors.blue,
      ),
    ],
  );
}

Widget mybottom(context) {
  return Center(
    child: ElevatedButton(
      child: const Text('showModalBottomSheet'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
