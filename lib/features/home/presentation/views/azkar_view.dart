import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/views/azkar_detailed_view.dart';
import 'package:ana_muslim/features/home/presentation/widgets/azkar_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_app_bar.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const VerticalSpacer(height: 16),
            CustomAppBar(
              doAlso: () {},
            ),
            const VerticalSpacer(height: 22),
            BlocBuilder<HomeCubitCubit, HomeCubitState>(
              buildWhen: (previous, current) =>
                  current is InitializingAzkarErrorState ||
                  current is InitializingAzkarState ||
                  current is InitializingAzkarSuccessState,
              builder: (context, state) {
                if (state is InitializingAzkarSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount:
                          context.read<HomeCubitCubit>().azkrMOdel.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          context
                              .read<HomeCubitCubit>()
                              .chooseSpacificZekr(index: index);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AzkarDetailedView(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          margin: EdgeInsets.only(
                              left: 26.w, right: 18.w, bottom: 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(26.r),
                              bottomRight: Radius.circular(26.r),
                            ),
                          ),
                          child: Text(
                            context
                                .read<HomeCubitCubit>()
                                .azkrMOdel[index]
                                .category,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const Expanded(
                  child: CustomAzkarShimmer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
