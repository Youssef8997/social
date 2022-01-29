
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whatsappu/login/Login.dart';
import 'package:whatsappu/sherdhelper/sherdhelper.dart';

class pagemodel {
  final String page;
  final String title;
  final String body;

  pagemodel({
    required this.page,
    required this.title,
    required this.body,
  });
}

class start extends StatefulWidget {
  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  var controlar = PageController();

  List<pagemodel> module = [
    pagemodel(
        page:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRamdG7yC12CSBhjOs73BcQElW4GU6f_dav4H0eVPae7nUQLwryGFINA_kw5B79EJ_grXI&usqp=CAU",
        title: "your work need be connect with all world ",
        body: "let`s connection with Each other"),
    pagemodel(
        page:
            "https://influencermarketinghub.com/wp-content/uploads/2020/03/Best-Social-Media-Posting-App.png",
        title: "so we are your tool to make that",
        body: "let`s connection with Each other"),
    pagemodel(
        page:
            "https://www.elegantthemes.com/blog/wp-content/uploads/2017/07/FeaturedImage2-1.png",
        title: "and make you online 24/7",
        body: "let`s connection with Each other")
  ];
  bool? isfalse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(
            child:  SizedBox(),
            bottom: true,
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => buildptage(module[index],context),
              onPageChanged: (index) {
                if (index == module.length - 1) {
                  setState(() {
                    isfalse = true;
                  });
                } else {
                  setState(() {
                    isfalse = false;
                  });
                }
              },
              itemCount: module.length,
              controller: controlar,
              physics: const BouncingScrollPhysics(),
            ),
          ),
          Container(
            height:103.45,
            color: HexColor("#052053"),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: controlar,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.indigo,
                      dotColor: Colors.grey,
                      dotHeight: 15.0,
                      expansionFactor: 2.0,
                      dotWidth: 15.0,
                      radius: 20.0),
                  count: module.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    if (isfalse == true) {
                      sherdprefrence
                          .setdate(key: "onbord", value: true)
                          .then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (Route route) => false);
                      });
                    } else {
                      controlar.nextPage(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios,color: Colors.indigo,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
Widget buildptage(pagemodel module,context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //photo
      Container(
        color: HexColor("#052053"),
        child: Container(
            height: 400,
            width: 400,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(65.0),
            )),
            child: Image.network(
            "https://okcredit-blog-images-prod.storage.googleapis.com/2021/02/se3.jpg",
              width: MediaQuery.of(context).size.width,
              height: 100,
              cacheHeight: 250,
              cacheWidth: 500,
              fit: BoxFit.fill,
            )),
      ),
      //text
      Container(
        height: 250,
        width: 520,
        decoration: BoxDecoration(
            color: HexColor("#052053"),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(55.0),
            )),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            SizedBox(
              width:250,
              child: Text(
                module.body,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 10,),
             SizedBox(
              width:250,
              child: Text(
                module.title,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
