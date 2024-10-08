import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_app_bar.dart';

class AzkarDetailedView extends StatelessWidget {
  const AzkarDetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 18),
              CustomAppBar(
                doAlso: () {},
              ),
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
                              border: Border.all(color: AppColors.primary),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              context
                                  .read<HomeCubitCubit>()
                                  .someZekr![index]
                                  .text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
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
      ),
    );
  }
}
