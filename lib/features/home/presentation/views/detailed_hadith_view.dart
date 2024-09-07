import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/utils/functions.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:ana_muslim/features/home/presentation/widgets/hadith_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedHadithView extends StatelessWidget {
  const DetailedHadithView({super.key});

  @override
  Widget build(BuildContext context) {
    final label = ModalRoute.of(context)?.settings.arguments as String;
    context.read<HomeCubitCubit>().watchHadithPagination(label);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 16),
              CustomAppBar(
                doAlso: () {
                  context.read<HomeCubitCubit>().hadith.clear();
                },
              ),
              const VerticalSpacer(height: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                margin: EdgeInsets.only(bottom: 12.h, left: 12.w, right: 12.w),
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.offRed),
                ),
                child: Text(
                  translateHadithName(label),
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is LoadingHadithState ||
                    current is HadithErrorState ||
                    current is HadithSuccessState ||
                    current is PaginationState ||
                    current is ReadyPaginationState,
                builder: (context, state) {
                  if (state is HadithSuccessState ||
                      state is PaginationState ||
                      state is ReadyPaginationState) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        controller:
                            context.read<HomeCubitCubit>().scrollController,
                        itemCount: context.read<HomeCubitCubit>().isLoading
                            ? context.read<HomeCubitCubit>().hadith.length + 1
                            : context.read<HomeCubitCubit>().hadith.length,
                        itemBuilder: (context, index) {
                          if (index >=
                                  context
                                      .read<HomeCubitCubit>()
                                      .hadith
                                      .length &&
                              state is PaginationState) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: const Center(
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor:
                                      AppColors.homeScaffoldContainer,
                                  valueColor:
                                      AlwaysStoppedAnimation(AppColors.offRed),
                                ),
                              ),
                            );
                          }
                          return SingleHadithItem(
                              order: context
                                  .read<HomeCubitCubit>()
                                  .hadith[index]
                                  .number,
                              hadith: context
                                  .read<HomeCubitCubit>()
                                  .hadith[index]
                                  .arab);
                        },
                      ),
                    );
                  }
                  return const Expanded(
                    child: CustomHadithShimmer(),
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

class SingleHadithItem extends StatelessWidget {
  const SingleHadithItem({
    super.key,
    required this.order,
    required this.hadith,
  });
  final int order;
  final String hadith;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 10.h, left: 12.w, right: 12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.offRed),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 20.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r)),
                color: AppColors.offRed),
            child: Text(
              order.toString(),
              style: const TextStyle(color: AppColors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                hadith,
              ),
            ),
          )
        ],
      ),
    );
  }
}
