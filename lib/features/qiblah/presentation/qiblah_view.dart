// ignore_for_file: unused_local_variable

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QiblahView extends StatelessWidget {
  const QiblahView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VerticalSpacer(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgHandler(
                imagePath: 'assets/svgs/compass.svg',
                height: height / 2.2,
                width: width / 1.2,
                color: AppColors.primary,
              ),
              Transform.translate(
                offset: Offset(3.w, 0),
                child: SvgHandler(
                  imagePath: 'assets/svgs/needle.svg',
                  height: height / 3.4,
                  width: width / 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
