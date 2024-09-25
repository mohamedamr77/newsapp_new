import 'package:flutter/material.dart';
import 'package:newsappcode/features/search/presentation/view/widgets/search_body.dart';

import '../../../../core/utils/color_app.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: ColorApp.whiteColor,
      body: SearchBody(),
    );
  }
}
