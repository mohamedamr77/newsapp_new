import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappcode/features/home_page/data/model/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/utils/launch_url.dart';
import '../../../../news_mark/presentation/view_model/news_mark_controller/book_mark_state.dart';
import '../../../../news_mark/presentation/view_model/news_mark_controller/news_mark_cubit.dart';

class ListViewBody extends StatelessWidget {
  const ListViewBody({super.key, required this.articlesModel});

  final ArticlesModel articlesModel;

  @override
  Widget build(BuildContext context) {
    DateTime articleTime = DateTime.parse(
        articlesModel.publishedAt!); // Parse the string to DateTime
    String timeAgo = timeago.format(articleTime,
        locale: 'en_ short'); // Convert to time ago format
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
      child: GestureDetector(
        onTap: () {
          launchCustomUrl(url: articlesModel.url ?? "", context: context);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 195.h,
                  width: double.infinity,
                  imageUrl: articlesModel.urlToImage ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                        height: 195.h,
                        width: double.infinity,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[600]!,
                          highlightColor: Colors.grey[400]!,
                          direction: ShimmerDirection.ltr,
                          // Left to right shimmer
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
                  errorWidget: (context, url, error) => Image.asset(
                        "assets/images/image_failed.jpg",
                        height: 195.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      )),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                articlesModel.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 6),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 8.w,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    articlesModel.source!.name!,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff4E4B66),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 7,
                    child: Image(
                      image: AssetImage("assets/images/time.png"),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      timeAgo,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff4E4B66),
                      ),
                    ),
                  ),
                  BlocBuilder<NewsMarkCubit, NewsMarkState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<NewsMarkCubit>(context)
                              .changeNewsMarkForNewsItem(articlesModel);
                        },
                        // child: const Icon(Icons.NewsMark_border),
                        child: articlesModel.newsMark
                            ? const Icon(
                                Icons.bookmark,
                                color: Colors.blue,
                              )
                            : const Icon(Icons.bookmark_border),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
