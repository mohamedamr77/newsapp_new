import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsappcode/core/utils/style_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backGroundColor,
    required this.nameButton,
    required this.onTap,
    this.image,
    this.isLoading = false,
    this.widget,
  });

  final void Function()? onTap;
  final Color backGroundColor;
  final String nameButton;
  final String? image;
  final bool isLoading;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameButton,
                    textAlign: TextAlign.center,
                    style: StyleApp.textStyle3,
                  ),
                  if (image != null) ...[
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      image!,
                    ),
                  ],
                  if (widget != null) ...[
                    const SizedBox(width: 10),
                    widget!,
                  ],
                ],
              ),
      ),
    );
  }
}
