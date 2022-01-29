import 'package:flutter/material.dart';
import 'package:whatsappu/homelayout/cuibt/cuibt.dart';

class video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("logout"),
      onPressed: (){whatsappe.get(context).logout();},
    );
  }
}
