import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/custom_form_field.dart';
import '../../../../../core/shared_widget/logo_app.dart';
import '../../../../../core/utils/border_text_field.dart';
import '../../../../../core/utils/color_app.dart';
import '../../view_model/get_search_news/get_search_news_cubit.dart';
import '../../view_model/get_search_news/get_search_news_state.dart';
import 'list_view_news_search.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetSearchNewsCubit>(context);
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(alignment: Alignment.center, child: LogoApp()),
              CustomFormField(
                fillColor: ColorApp.whiteColor,
                hintText: "Search",
                enabledBorder:
                    BorderTextField.enabledBorderTextFormFieldHomePage,
                focusBorder: BorderTextField.focusedBorderTextFormFieldHomePage,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/images/svg/Vector.svg",
                  ),
                ),
                onChanged: (value) {
                  cubit.fetchSearchResult(category: value);
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              BlocBuilder<GetSearchNewsCubit, SearchNewsState>(
                builder: (context, state) {
                  if (cubit.resultSearchList.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Lottie.asset("assets/images/lottie/search.json",
                            height: 300.h, width: 350.w),
                      ),
                    );
                  }
                  return const ListViewNewsSearch();
                },
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              NavigationManager.goBack();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 32.w,
            ),
          ),
        ],
      ),
    );
  }
}

/*
 Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.06.w, vertical: 0.02.h),
            child: const CustomText(
              text: "Search result :",
            ),
          ),
 */
