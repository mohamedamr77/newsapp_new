import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(
    {required String url, required BuildContext context}) async {
  final Uri parsedUrl = Uri.parse(url);
  if (await canLaunchUrl(parsedUrl)) {
    !await launchUrl(parsedUrl);
  } else {
    Fluttertoast.showToast(
      msg: "The Url Is Not Valied",
      fontSize: 16,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webShowClose: true,
    );
  }
}
