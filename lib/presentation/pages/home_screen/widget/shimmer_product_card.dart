import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerProductCardWidget extends StatelessWidget {
  const ShimmerProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 10),
      interval: const Duration(seconds: 10),
      color: Colors.grey,
      colorOpacity: 0.4,
      enabled: true,
      direction: const ShimmerDirection.fromLTRB(),
      child: Card(
        elevation: 0.5,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 5.0.h,
                  top: 5.0.h,
                  left: 10.w,
                ),
                child: Row(
                  children: [
                    Shimmer(
                      duration: const Duration(seconds: 10),
                      interval: const Duration(seconds: 10),
                      color: Colors.grey,
                      colorOpacity: 0.4,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.04),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.0.w,
                  // top: 8.h,
                ),
              ),
              SizedBox(
                height: 79.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7.h),
                    Shimmer(
                      duration: const Duration(seconds: 10),
                      interval: const Duration(seconds: 10),
                      color: Colors.grey,
                      colorOpacity: 0.4,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: Container(
                        width: 160.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.04),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Shimmer(
                      duration: const Duration(seconds: 10),
                      interval: const Duration(seconds: 10),
                      color: Colors.grey,
                      colorOpacity: 0.4,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: Container(
                        width: 160.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.04),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
