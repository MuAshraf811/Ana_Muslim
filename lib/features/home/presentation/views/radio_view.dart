import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/views/dummy_web.dart';
import 'package:ana_muslim/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:ana_muslim/features/home/presentation/widgets/hadith_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 20),
              CustomAppBar(
                doAlso: () {},
              ),
              const VerticalSpacer(height: 12),
              BlocBuilder<HomeCubitCubit, HomeCubitState>(
                buildWhen: (previous, current) =>
                    current is GettingRadioState ||
                    current is RadioErrorState ||
                    current is RadioSuccessState,
                builder: (context, state) {
                  if (state is RadioSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            context.read<HomeCubitCubit>().radioChannels.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DummyWeb(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 14.h),
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: AppColors.primary),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    context
                                        .read<HomeCubitCubit>()
                                        .radioChannels[index]
                                        .name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  height: 62.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      image: DecorationImage(
                                          image: NetworkImage(context
                                              .read<HomeCubitCubit>()
                                              .radioChannels[index]
                                              .image),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return const Expanded(child: CustomHadithShimmer());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
