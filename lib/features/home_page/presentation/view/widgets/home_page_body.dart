import 'package:flutter/material.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_news.dart';
import 'custom_sliver_appbar.dart';
class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomSliverAppbar(),
          ListViewNews(),
        ],
      ),
    );
  }
}