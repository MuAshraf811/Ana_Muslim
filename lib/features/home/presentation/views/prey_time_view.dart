import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/quran_view_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/utils_constants.dart';
import '../../../../core/cubit/internet_chicker/internet_connection_checker_cubit.dart';
import '../../../../core/utils/functions.dart';

class PreyTimeView extends StatelessWidget {
  const PreyTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 18),
              const QuranAppBar(
                text:
                    "إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَوْقُوتًا",
              ),
              const VerticalSpacer(height: 22),
              const VerticalSpacer(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateTime.now().year.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const HorizontalSpacer(width: 10),
                  Text(
                    getMonthByItsOrder(DateTime.now().month),
                  ),
                ],
              ),
              const VerticalSpacer(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: DropdownButtonFormField(
                  enableFeedback: false,
                  menuMaxHeight: MediaQuery.sizeOf(context).height / 1.8,
                  value: egyptianGovernoratesEnglish[2],
                  dropdownColor: AppColors.white,
                  onChanged: (val) {},
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.offRed,
                    size: 20,
                  ),
                  decoration: InputDecoration(
                    fillColor: AppColors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: AppColors.offRed)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: AppColors.offRed)),
                  ),
                  items: egyptianGovernoratesEnglish
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              const VerticalSpacer(height: 12),
              BlocConsumer<InternetConnectionCheckerCubit,
                  InternetConnectionCheckerState>(
                listener: (context, state) {
                  if (state is InternetConnectionState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Succefully connected o internet',
                          style: TextStyle(color: AppColors.white),
                        ),
                        backgroundColor: AppColors.primary,
                        showCloseIcon: true,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is InternetConnectionState) {
                    return BlocBuilder<HomeCubitCubit, HomeCubitState>(
                      buildWhen: (previous, current) =>
                          current is FetchingPreyTimeState ||
                          current is FetchingPreyTimeErrorState ||
                          current is FetchingPreyTimeSuccessState,
                      builder: (context, state) {
                        if (state is FetchingPreyTimeSuccessState) {
                          return Container(
                            height: MediaQuery.sizeOf(context).height / 1.9,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.primaryBlueDarker)),
                            ),
                            child: ListView(
                              children: [
                                DataTable(
                                    headingRowColor:
                                        const WidgetStatePropertyAll(
                                            AppColors.primaryBlueDarker),
                                    headingTextStyle:
                                        const TextStyle(color: AppColors.white),
                                    border: TableBorder(
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
                                    columnSpacing: 8.w,
                                    dataRowMinHeight: 36.h,
                                    dataRowMaxHeight: 54.h,
                                    columns: const [
                                      DataColumn(
                                        label: Text("العشاء"),
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
                                        label: Text('    اليوم'),
                                      ),
                                    ],
                                    rows: context
                                        .read<HomeCubitCubit>()
                                        .allPreyTimes
                                        .map(
                                          (e) => DataRow(
                                            selected:
                                                getCurrentDate() == e.date,
                                            cells: [
                                              DataCell(Text(
                                                !e.isha.contains('(EEST)')
                                                    ? e.isha
                                                    : e.isha.substring(0, 6),
                                                style: const TextStyle(
                                                    fontSize: 13),
                                              )),
                                              DataCell(Text(
                                                !e.maghrib.contains('(EEST)')
                                                    ? e.maghrib
                                                    : e.maghrib.substring(0, 6),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.offRed,
                                                ),
                                              )),
                                              DataCell(Text(
                                                !e.asr.contains('(EEST)')
                                                    ? e.asr
                                                    : e.asr.substring(0, 6),
                                                style: const TextStyle(
                                                    fontSize: 13),
                                              )),
                                              DataCell(Text(
                                                !e.dhuhr.contains('(EEST)')
                                                    ? e.dhuhr
                                                    : e.dhuhr.substring(0, 6),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.offRed,
                                                ),
                                              )),
                                              DataCell(
                                                Text(
                                                  !e.fajr.contains('(EEST)')
                                                      ? e.fajr
                                                      : e.fajr.substring(0, 6),
                                                  style: const TextStyle(
                                                      fontSize: 13),
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  "${e.hijiriDate.substring(0, 2)}/${e.date.substring(0, 2)}",
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: AppColors.offRed,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              DataCell(
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    e.weekDay,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList()),
                              ],
                            ),
                          );
                        }

                        return const Expanded(child: PreyShimmer());
                      },
                    );
                  }
                  return const Center(
                    child: Text(
                        "OOpS ,It seems that there is no Internet Connection"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreyShimmer extends StatelessWidget {
  const PreyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 24.h,
            width: 64.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
          const VerticalSpacer(height: 12),
          Container(
            height: 36.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
          const VerticalSpacer(height: 12),
          Container(
            height: 36.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
          const VerticalSpacer(height: 12),
          Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}

class RowTexts extends StatelessWidget {
  const RowTexts(
      {super.key,
      required this.keyText,
      required this.valueText,
      required this.icon});
  final String keyText;
  final String valueText;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            valueText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(flex: 5),
          Text(
            keyText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(flex: 1),
          SvgHandler(imagePath: icon, height: 24, width: 24),
        ],
      ),
    );
  }
}
