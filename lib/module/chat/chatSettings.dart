import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';


class ChatSittings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    var cuibt = whatsappe.get(context);
    return BlocConsumer<whatsappe, whatsappstates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                    whatsappe.get(context).updateuserinfo(
                        phone: cuibt.model!.phone,
                        email: cuibt.model!.email,
                        name: cuibt.model!.name,
                        bio: cuibt.model!.bio,
                        urlwall: cuibt.wallcamImageUrl);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                title: const Text("setting", style: TextStyle(color: Colors.white)),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    ExpansionTile(
                      title: const Text("change bubble color"),
                      leading: const Icon(Icons.edit),
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //lift button
                                  Column(
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          settingDialog(context);
                                        },
                                        child: const Icon(Icons.edit),
                                        color: cuibt.mymassgeC,
                                      ),
                                      const SizedBox(
                                          height: 50,
                                          width: 135,
                                          child:  Text(
                                            "  your bubble color",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          )),
                                    ],
                                  ),
                                  //another button
                                  Column(
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          settingrDialog(context);
                                        },
                                        child: const Icon(Icons.edit),
                                        color: cuibt.theremassgeC,
                                      ),
                                      const SizedBox(
                                          height: 50,
                                          width: 140,
                                          child: Text(
                                            "there bubble color",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              whatsappe.get(context).mymassgeC,
                                          borderRadius:
                                          const BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(25.0),
                                            bottomEnd: Radius.circular(25.0),
                                            bottomStart: Radius.circular(25.0),
                                          )),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Column(
                                        children: const [
                                          Text(
                                            "hello world",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: whatsappe
                                              .get(context)
                                              .theremassgeC,
                                          borderRadius:
                                          const BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(25.0),
                                            bottomEnd: Radius.circular(25.0),
                                            bottomStart: Radius.circular(25.0),
                                          )),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Column(
                                        children: const [
                                          Text(
                                            "hello world",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                        if(cuibt.wallcamImageUrl!=null)
                    SizedBox(
                      height: 500,
                      width: double.infinity,

                      child: Stack(
                        children: [

                          Container(
                            decoration:BoxDecoration(
                                image:DecorationImage(image: NetworkImage("${cuibt.wallcamImageUrl}"))
                            ),
                          ),
                          buildmassge(context),
                          buildmymassge(context),
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: const Text("Wallpeper"),
                      leading: const Icon(Icons.photo),
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: Size.height * .2,
                              width: Size.width - 40,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cuibt.getwallCAMImage();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.photo_camera_rounded,
                                            color: Colors.grey.shade800,
                                            size: 30.0),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Camera",
                                          style: TextStyle(fontSize: 20.0),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => cuibt.getwallImage(),
                                    child: Row(
                                      children: [
                                        Icon(Icons.photo_library,
                                            color: Colors.grey.shade800,
                                            size: 30.0),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "gallary",
                                          style: TextStyle(fontSize: 20.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ]),
                ),
              ));
        });
  }

}
Widget buildmassge(context) =>
    Padding(
      padding: const EdgeInsets.only(top: 20,left: 10),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Container(
          height: 50,

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
            children:const [
              Text(
                "hallo world ",
                style:TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );

Widget buildmymassge(context,) =>
    Padding(
      padding: const EdgeInsets.only(top: 20,left: 10),
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Container(
          height: 50,
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
            children:const  [
              Text(
                "hallo world",
                style:  TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
settingDialog(context,) {
  var cuibt = whatsappe.get(context);
  return showDialog(
      barrierDismissible: false,
      useSafeArea: false,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: 200,
          child: AlertDialog(
            title: const Text("change colors"),
            content: ColorPicker(
                enableAlpha: true,
                pickerAreaBorderRadius: BorderRadius.circular(10),
                hexInputBar: false,
                displayThumbColor: true,
                pickerColor: cuibt.mymassgeC,
                onColorChanged: (colors) {
                  cuibt.changecolor(colors);
                }),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.done))
            ],
          ),
        );
      });
}

settingrDialog(
  context,
) {
  var cuibt = whatsappe.get(context);
  return showDialog(
      barrierDismissible: false,
      useSafeArea: false,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: 200,
          child: AlertDialog(
            title: const Text("change colors"),
            content: ColorPicker(
              pickerColor: cuibt.theremassgeC,
              onColorChanged: (colorl) => cuibt.changetherecolor(colorl),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.done))
            ],
          ),
        );
      });
}
