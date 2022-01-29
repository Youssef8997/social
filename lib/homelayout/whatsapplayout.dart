
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';
import 'package:whatsappu/homelayout/cuibt/states.dart';
class whatsapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<whatsappe,whatsappstates>(
      listener: (context,state){},
      builder: (context,state){
        var y=whatsappe.get(context);

        return Scaffold(

        /*  body: Container(
            child: y.screens[y.sindex],
          ),*/
          bottomNavigationBar:Container(
            padding: const EdgeInsetsDirectional.only(top:35,bottom: 0,),
            child: PersistentTabView(
              context,
              items: y.bottomNav,
              screens:y.screens,
        backgroundColor:HexColor("#052053"), // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
      navBarStyle: NavBarStyle.style15,
              navBarHeight:55 ,// Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(15.0),
        colorBehindNavBar: Colors.white,
             adjustScreenBottomPaddingOnCurve: true
              // Choose the nav bar style with this property.
            ),
              screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds:300),
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
                duration: Duration(milliseconds:300),
                curve: Curves.ease,
              ),
            ),
          )
        );
      },

    );
  }
}
