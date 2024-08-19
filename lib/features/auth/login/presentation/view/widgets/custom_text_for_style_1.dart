import 'package:flutter/material.dart';

import '../../../../../../core/utils/style_app.dart';

class CustomTextForStyle1 extends StatelessWidget {
  const CustomTextForStyle1({super.key, required this.text, this.textAlign});
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
     text,
      style: StyleApp.textStyle1,
    );
  }
}
