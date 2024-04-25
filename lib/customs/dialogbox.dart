import 'package:flutter/material.dart';
import '../constant/app_color.dart';

Future DialogBox(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(text, style: TextStyle(fontFamily: "regular",color: AppColor.yellow)),
            backgroundColor: AppColor.green,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("okay",
                      style: TextStyle(fontFamily: "regular",color: AppColor.yellow)))
            ],
          ));
}
