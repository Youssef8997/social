import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whatsappu/comp/comp.dart';
import 'package:whatsappu/homelayout/whatsapplayout.dart';
import 'package:whatsappu/login/cuibt/cuibt.dart';
import 'package:whatsappu/login/cuibt/states.dart';
import 'package:whatsappu/module/Regstar/regster_screen.dart';

class Login extends StatelessWidget {
  var kayform = GlobalKey<FormState>();
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cuibtwhats, whatsappshopappstate>(
      listener: (context, state) {
        if (state is whatsappsloginhopappstateerro) {
          showtoast(msg: state.error.toString(), color: Colors.red);
        } else if (state is whatsapploginshopappstatesucsses) {
          NEV(context: context, page: whatsapp());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SafeArea(
                    child: SizedBox(
                  height: 1,
                )),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: HexColor("#052053"),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(75),
                          )),
                    ),
                    const CircleAvatar(
                      radius: 80,

                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                      //child: Image.network("https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"),
                    ),
                  ],
                ),
                Container(
                  padding:const EdgeInsetsDirectional.only(end:2),
                  color: HexColor("#052053"),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(60)
                      ),
                      color: Colors.white,
                    ),

                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: kayform,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              label: const Text("Email"),
                              labelStyle: const TextStyle(fontSize: 22.0),
                              prefixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              // counterText: "Email Must have Example:@gamil.com",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email must not be empty";
                              }
                              return null;
                            },
                            controller: email,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              label: const Text("password"),
                              labelStyle: const TextStyle(fontSize: 22.0),
                              prefixIcon: const Icon(Icons.lock_open),
                              suffixIcon:  IconButton(
                                  icon: cuibtwhats.get(context).isobes
                                      ? const Icon(Icons.visibility)
                                      :const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    cuibtwhats.get(context).obserd();
                                    if (kDebugMode) {
                                      print(cuibtwhats.get(context).isobes);
                                    }
                                  }),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              // counterText: "Email Must have Example:@gamil.com",
                            ),
                            obscureText: cuibtwhats.get(context).isobes,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "pass must not be empty";
                              }
                              return null;
                            },
                            controller: pass,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          ConditionalBuilder(
                            condition: true,
                            builder: (BuildContext context) => Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(50.0)),
                                width: 150,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (kayform.currentState!.validate()) {
                                      cuibtwhats.get(context).userloging(
                                          email: email.text,
                                          password: pass.text);
                                    }
                                  },
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color:HexColor("#052053"),
                                  shape: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                )),
                            fallback: (BuildContext context) => Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                50.0)),
                                    width: 150,
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: const Text("please wait .......",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: Colors.black45,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                    )),
                              ],
                            ),
                          ),
                          /* SizedBox(
                                  height: 10.0,
                                ),*/
                          MaterialButton(
                              onPressed: () {},
                              child: const Text("dont have email?",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white))),
                          SizedBox(
                            height: 40.0,
                            width: 150.0,
                            child: MaterialButton(
                              onPressed: () {
                                NEV(
                                    page: regster(),
                                    context: context,
                                    bool: true);
                              },
                              child: const Text("REGSTER",
                                  style: TextStyle(color: Colors.white)),
                              color:HexColor("#052053"),
                              shape:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
