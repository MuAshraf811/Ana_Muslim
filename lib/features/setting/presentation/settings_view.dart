import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/images/Rectangle 9(2).png',
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  margin: EdgeInsets.only(top: 32.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.navIconGrey,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.primaryBlueDarker,
                        size: 16,
                      ),
                      HorizontalSpacer(width: 22),
                      Text("ربيع الأول 1446"),
                      HorizontalSpacer(width: 22),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.primaryBlueDarker,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DataTable(
              headingRowColor:
                  const WidgetStatePropertyAll(AppColors.primaryBlueDarker),
              headingTextStyle: const TextStyle(color: AppColors.white),
              border: TableBorder(
                  bottom: const BorderSide(color: AppColors.primaryBlueDarker),
                  left: const BorderSide(color: AppColors.primaryBlueDarker),
                  right: const BorderSide(color: AppColors.primaryBlueDarker),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    topLeft: Radius.circular(12.r),
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r),
                ),
              ),
              columnSpacing: 12.w,
              dataRowMinHeight: 36.h,
              dataRowMaxHeight: 54.h,
              columns: const [
                DataColumn(
                  label: Text('العشاء'),
                ),
                DataColumn(
                  label: Text('المغرب'),
                ),
                DataColumn(
                  label: Text('العصر'),
                ),
                DataColumn(
                  label: Text('الظهر'),
                ),
                DataColumn(
                  label: Text('الفجر'),
                ),
                DataColumn(
                  label: Text('م / هـ'),
                ),
                DataColumn(
                  label: Text('اليوم'),
                ),
              ],
              rows: const [
                DataRow(
                  // color:
                  //     WidgetStatePropertyAll(AppColors.primaryBlue.withOpacity(0.3)),
                  cells: [
                    DataCell(Text('السبت')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                  ],
                ),
                DataRow(
                  // color:
                  //     WidgetStatePropertyAll(AppColors.primaryBlue.withOpacity(0.3)),
                  cells: [
                    DataCell(Text('السبت')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                  ],
                ),
                DataRow(
                  // color:
                  //     WidgetStatePropertyAll(AppColors.primaryBlue.withOpacity(0.3)),
                  cells: [
                    DataCell(Text('السبت')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                  ],
                ),
                DataRow(
                  // color:
                  //     WidgetStatePropertyAll(AppColors.primaryBlue.withOpacity(0.3)),
                  cells: [
                    DataCell(Text('السبت')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                  ],
                ),
                DataRow(
                  // color:
                  //     WidgetStatePropertyAll(AppColors.primaryBlue.withOpacity(0.3)),
                  cells: [
                    DataCell(Text('السبت')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                  ],
                ),
                DataRow(
                  // color:
                  //     WidgetStatePropertyAll(AppColors.primaryBlue.withOpacity(0.3)),
                  cells: [
                    DataCell(Text('السبت')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                  ],
                ),
                DataRow(
                  // color:
                  //     WidgetStatePropertyAll(AppColors.primaryBlue.withOpacity(0.3)),
                  cells: [
                    DataCell(Text('السبت')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                    DataCell(Text('39:12')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
