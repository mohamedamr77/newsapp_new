import 'package:flutter/material.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_body.dart';

class ListViewNews extends StatelessWidget {
  const ListViewNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return const ListViewBody();
    }, childCount: 10));
  }
}
