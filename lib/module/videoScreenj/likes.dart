
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';
import 'package:whatsappu/model/likemodel.dart';

class likes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<whatsappe, whatsappstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "likes",
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, h) =>
                    dialog(whatsappe.get(context).liked[h]),
                separatorBuilder: (context, state) => const SizedBox(
                      height: 10,
                    ),
                itemCount: whatsappe.get(context).liked.length),
          );
        });
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
}

