import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'build_shimmer_shape.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
              child: Column(
                children: [
                  BuildShimmerShape(
                    height: 195.h,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const BuildShimmerShape(),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      BuildShimmerShape(
                        width: 100.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      BuildShimmerShape(
                        width: 80.w,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 12.w,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey[600]!,
                          highlightColor: Colors.grey[400]!,
                          direction:
                              ShimmerDirection.ltr, // Left to right shimmer
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[600],
                            radius: 16.w,
                          )),
                    ],
                  ),
                ],
              ));
        },
        itemCount: 10,
      ),
    );
  }
}
