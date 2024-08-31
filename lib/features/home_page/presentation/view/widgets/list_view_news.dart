import 'package:flutter/material.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_body.dart';

class ListViewNews extends StatelessWidget {
  const ListViewNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const ListViewBody();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox( height: 10,);
      },
      itemCount: 10,
    );
  }
}
