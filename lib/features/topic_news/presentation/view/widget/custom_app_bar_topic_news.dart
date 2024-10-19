import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/color_app.dart';
import '../../view_model/fetch_topic_news/fetch_topic_news_cubit.dart';

class CustomAppBarTopicNews extends StatelessWidget {
  const CustomAppBarTopicNews(
      {super.key, required this.topicName,  this.index,  this.navigatePop =true});
  final String topicName;
  final int? index;
  final bool navigatePop;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FetchTopicNewsCubit>(context);
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(topicName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                  )),
            ),
            if (navigatePop ==true)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                cubit.topicNewsList = [];
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        const Divider(
          color: ColorApp.primaryColor,
        ),
      ],
    );
  }
}
