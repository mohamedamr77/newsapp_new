import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappcode/core/utils/color_app.dart';
import 'package:newsappcode/features/topic_news/presentation/view_model/fetch_topic_news/fetch_top_news_state.dart';
import 'package:newsappcode/features/topic_news/presentation/view_model/fetch_topic_news/fetch_topic_news_cubit.dart';

import '../../../../home_page/presentation/view/widgets/list_view_body.dart';

class TopicNewsBody extends StatefulWidget {
  const TopicNewsBody({super.key, required this.topicName});
  final  String topicName;

  @override
  State<TopicNewsBody> createState() => _TopicNewsBodyState();
}

class _TopicNewsBodyState extends State<TopicNewsBody> {

  @override
  void initState(){
    super.initState();
    BlocProvider.of<FetchTopicNewsCubit>(context).fetchTopicNewsCubit(topic: widget.topicName);


  }


  @override
  Widget build(BuildContext context) {
   var   cubit =BlocProvider.of<FetchTopicNewsCubit>(context);
    return   SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(widget.topicName,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    )),
              ),
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                    cubit.topicNewsList=[];
                  },
                  icon:  Icon(Icons.arrow_forward_ios,color: Colors.black,),
              ),



            ],
          ),
          SizedBox(height: 6.h,),
          const Divider(
            color: ColorApp.primaryColor,
          ),
          BlocBuilder<FetchTopicNewsCubit, FetchTopicNewsState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListViewBody(articlesModel: cubit.topicNewsList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  },
                  itemCount: cubit.topicNewsList.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
