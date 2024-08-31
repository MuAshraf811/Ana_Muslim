import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/views/surahs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarDetailedView extends StatelessWidget {
  const AzkarDetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const VerticalSpacer(height: 18),
            const CustomAppBar(),
            const VerticalSpacer(height: 16),
            BlocBuilder<HomeCubitCubit, HomeCubitState>(
              buildWhen: (previous, current) =>
                  current is DetailedAzkarState ||
                  current is DetailedAzkarSuccessState,
              builder: (context, state) {
                if (state is DetailedAzkarSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount:
                          context.read<HomeCubitCubit>().someZekr!.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 16.h),
                        margin: EdgeInsets.only(bottom: 16.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.homeScaffoldContainer),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            context
                                .read<HomeCubitCubit>()
                                .someZekr![index]
                                .text,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              },
            )
          ],
        ),
      ),
    );
  }
}
