import 'package:flutter/material.dart';
import 'package:newsappcode/features/news_mark/presentation/view/widget/news_mark_body.dart';

import '../../../../core/utils/color_app.dart';

class NewsMarkScreen extends StatelessWidget {
  const NewsMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.whiteColor,
      body: NewsMarkBody(),
    );
  }
}
