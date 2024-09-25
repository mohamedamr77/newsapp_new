import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_cubit.dart';
import 'package:newsappcode/features/home_page/presentation/controller/get_general_news/get_general_news_state.dart';
import 'package:newsappcode/features/home_page/presentation/view/widgets/list_view_body.dart';
import 'package:shimmer/shimmer.dart';

class ListViewNews extends StatefulWidget {
  const ListViewNews({super.key});

  @override
  State<ListViewNews> createState() => _ListViewNewsState();
}

class _ListViewNewsState extends State<ListViewNews> {
  @override
  void initState(){
    super.initState();
    BlocProvider.of<GetGeneralNewsCubit>(context).fetchGeneralNews();
  }
  @override
  Widget build(BuildContext context) {
    var cubit= BlocProvider.of<GetGeneralNewsCubit>(context);
    debugPrint( cubit.generalNews.length.toString());
   return BlocConsumer<GetGeneralNewsCubit,GetGeneralNewsState>(
      builder: (BuildContext context, GetGeneralNewsState state) {
        if (state is GetGeneralNewsSuccessState){
          return  SliverList(
              delegate:
              SliverChildBuilderDelegate((context, index) {
                return  ListViewBody(articlesModel: cubit.generalNews[index],);
              },
                  childCount: cubit.generalNews.length
              )
          );
        }
        return  SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return  Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 195.h,
                  width: double.infinity,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[600]!,
                    highlightColor: Colors.grey[400]!,
                    direction: ShimmerDirection.ltr, // Left to right shimmer
                    child: Container(
                      height: 195.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h,),
                Shimmer.fromColors(
                  baseColor: Colors.grey[600]!,
                  highlightColor: Colors.grey[400]!,
                  direction: ShimmerDirection.ltr, // Left to right shimmer
                  child: Container(
                    height: 26.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 12.h,),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.grey[400]!,
                      direction: ShimmerDirection.ltr, // Left to right shimmer
                      child: Container(
                        height: 26.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w,),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.grey[400]!,
                      direction: ShimmerDirection.ltr, // Left to right shimmer
                      child: Container(
                        height: 26.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(width: 12.w,),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.grey[400]!,
                      direction: ShimmerDirection.ltr, // Left to right shimmer
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[600],
                        radius: 16.w,
                      )
                    ),

                  ],
                ),
              ],
            )
          );
        },
            childCount: 10
        )
        );
      },
      listener: (BuildContext context, GetGeneralNewsState state) {
   
      },
    );
  }
}
