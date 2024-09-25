import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/core/shared_widget/build_shimmer_shape.dart';
import 'package:newsappcode/features/topics/presentation/view/widgets/grid_view_item.dart';

import '../../../data/topics_list.dart';

class GridViewTopics extends StatelessWidget {
  const GridViewTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: topicsList.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // Two items in one row
            crossAxisSpacing: 25.w,  // Horizontal space between grid items
            mainAxisSpacing: 10.0,  // Vertical space between grid items
            childAspectRatio: 1.04,  // Aspect ratio for each grid item (width / height)
          ),
          itemBuilder: (context, index) {
            return GridViewItem(topicsModel: topicsList[index],);
          },
        ),
      ),
    );
  }
}
