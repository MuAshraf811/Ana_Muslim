import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/quran_view_appbar.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key, required this.page});
  final int page;
  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: widget.page);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const VerticalSpacer(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18.w,
                      color: AppColors.secondry,
                    )),
              ),
            ),
            const VerticalSpacer(height: 18),
            Expanded(
              child: PageView.builder(
                itemCount: 604,
                controller: controller,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    QuranOnePageItem(pageIndex: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuranOnePageItem extends StatelessWidget {
  const QuranOnePageItem({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset("assets/images/Quran/00${pageIndex + 1}.png"),
            Image.asset("assets/images/Quran/000${pageIndex + 1}.png"),
          ],
        ),
        const VerticalSpacer(height: 12),
        Divider(
          endIndent: 16.w,
          thickness: 1.h,
          color: AppColors.black,
          indent: 16.w,
          height: 12.h,
        ),
      ],
    );
  }
}
