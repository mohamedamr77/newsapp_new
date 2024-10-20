import 'package:flutter/material.dart';

import '../../../../login/presentation/view/widgets/facebook_or_google.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FacebookOrGoogle(
      name: "Facebook",
      image: "assets/images/face icon.png",
      onTap: () {},
      marginLeft: 24,
    );
  }
}
