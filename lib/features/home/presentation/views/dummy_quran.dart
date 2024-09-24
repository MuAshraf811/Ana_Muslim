import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class DummyQuran extends StatelessWidget {
  const DummyQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 24.h, left: 2.w, right: 2.w),
        itemCount: 604,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => QuranOnePageItem2(pageIndex: index),
      ),
    );
  }
}

class QuranOnePageItem2 extends StatelessWidget {
  const QuranOnePageItem2({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/quran2/${pageIndex + 1}.png',
          fit: BoxFit.fill,
        ),
        const VerticalSpacer(height: 20),
        Divider(
          color: AppColors.primary,
          endIndent: 24.w,
          indent: 24.w,
        ),
      ],
    );
  }
}
