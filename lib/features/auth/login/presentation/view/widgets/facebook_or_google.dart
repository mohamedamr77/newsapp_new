import 'package:flutter/material.dart';
import 'package:newsappcode/core/utils/style_app.dart';

class FacebookOrGoogle extends StatelessWidget {
  const FacebookOrGoogle(
      {super.key,
      required this.name,
      required this.image,
      required this.onTap,
      this.marginLeft,
      this.marginRight});
  final String name;
  final String image;
  final void Function()? onTap;
  final double? marginLeft;
  final double? marginRight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: EdgeInsets.only(left: marginLeft ?? 0, right: marginRight ?? 0),
        width: MediaQuery.of(context).size.width * 0.406,
        decoration: BoxDecoration(
          color: const Color(0xffEEF1F4),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                image,
              ),
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              name,
              style: StyleApp.textStyle4,
            ),
          ],
        ),
      ),
    );
  }
}
