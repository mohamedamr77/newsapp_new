import 'package:flutter/material.dart';

class ImageTopContainerForm extends StatelessWidget {
  const ImageTopContainerForm({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.0584),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image(
          image: AssetImage(
            imagePath,
          ),
          width: MediaQuery.of(context).size.width * 0.1682,
          height: MediaQuery.of(context).size.height * 0.02591,
        ),
      ),
    );
  }
}
