import 'package:flutter/material.dart';

class BorderTextField {
  static InputBorder? borderTextFormFieldAuth = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Color(0xff4E4B66),
      width: 1,
    ),
  );
  static InputBorder? enabledBorderTextFormFieldAuth = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Color(0xff4E4B66),
      width: 1,
    ),
  );
  static InputBorder? focusedBorderTextFormFieldAuth = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Colors.blue,
      width: 1,
    ),
  );
  static InputBorder? focusedBorderTextFormFieldHomePage = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Colors.blue,
      width: 1,
    ),
  );
  static InputBorder? enabledBorderTextFormFieldHomePage = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Colors.blue,
      width: 1,
    ),
  );
}
