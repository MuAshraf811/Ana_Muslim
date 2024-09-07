import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/constants/app_route_path.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:ana_muslim/features/home/presentation/widgets/hadith_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/hadith_item.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 20),
              CustomAppBar(
                doAlso: () {},
              ),
              const VerticalSpacer(height: 24),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is FetchingHadithBooksState ||
                    current is FetchingHadithBooksErrorState ||
                    current is FetchingHadithBooksSuccessState,
                builder: (context, state) {
                  if (state is FetchingHadithBooksSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            context.read<HomeCubitCubit>().hadithBooks.length,
                        itemBuilder: (context, index) => InkWell(
                          focusColor:
                              AppColors.homeScaffoldContainer.withOpacity(0.2),
                          hoverColor:
                              AppColors.homeScaffoldContainer.withOpacity(0.3),
                          highlightColor:
                              AppColors.homeScaffoldContainer.withOpacity(0.3),
                          radius: BorderSide.strokeAlignInside,
                          borderRadius: BorderRadius.circular(8.r),
                          splashFactory: InkSparkle.splashFactory,
                          onTap: () {
                            context.read<HomeCubitCubit>().getHadiths(context
                                .read<HomeCubitCubit>()
                                .hadithBooks[index]
                                .id);
                            Navigator.pushNamed(
                              context,
                              RoutesConstants.detailedHadithView,
                              arguments: context
                                  .read<HomeCubitCubit>()
                                  .hadithBooks[index]
                                  .id,
                            );
                          },
                          child: HadithItem(index: index),
                        ),
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
