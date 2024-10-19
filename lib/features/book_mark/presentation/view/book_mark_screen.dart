import 'package:flutter/material.dart';
import 'package:newsappcode/features/book_mark/presentation/view/widget/book_mark_body.dart';

import '../../../../core/utils/color_app.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.whiteColor,
      body: BookMarkBody(),
    );
  }
}
