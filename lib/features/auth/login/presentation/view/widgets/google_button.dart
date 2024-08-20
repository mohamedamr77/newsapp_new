import 'package:flutter/material.dart';

import 'facebook_or_google.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FacebookOrGoogle(
      name: "Google",
      image: "assets/images/google.png",
      onTap: () {},
      marginRight: 24,
    );
  }
}
