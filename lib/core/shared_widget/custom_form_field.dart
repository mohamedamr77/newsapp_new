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

    this.suffixIcon,
    this.hintText,
    this.fillColor,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xff4E4B66),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xff4E4B66),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
