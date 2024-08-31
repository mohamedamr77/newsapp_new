import 'package:flutter/material.dart';
import 'package:newsappcode/core/utils/style_app.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChanged,
    this.validator,
    this.initialValue,
     this.border,
    this.enabledBorder,
    this.focusBorder,
    this.suffixIcon,
    this.hintText,
    this.fillColor,
    this.prefixIcon,
    this.obscureText = false,
  });
  final Color? fillColor;
  final int minLine;
  final int maxLine;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool obscureText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(

        obscureText: obscureText,
        obscuringCharacter: "*",
        initialValue: initialValue,
        onChanged: onChanged,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        maxLines: maxLine,
        minLines: minLine,
        onTapOutside: (e) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: StyleApp.textStyle6,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusBorder,
        ),
        validator: validator,
      ),
    );
  }
}
