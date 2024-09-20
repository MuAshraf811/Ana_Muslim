import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/core/router/app_router.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/qiblah/presentation/cubit/cubit/font_cubit.dart';
import 'package:ana_muslim/features/qiblah/presentation/cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnaMuslim extends StatelessWidget {
  const AnaMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavBArCubit>(
            create: (context) => NavBArCubit(),
          ),
          BlocProvider<FontCubit>(
            create: (context) => FontCubit(),
          ),
          BlocProvider<HomeCubitCubit>(
            create: (context) => HomeCubitCubit()
              ..generateCustomZekr()
              ..generateCustomDoaa()
              ..generateCustomAllahName()
              ..getUserlocation(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, int>(
          builder: (context, state) {
            return BlocBuilder<FontCubit, int>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: context.read<ThemeCubit>().state == 0
                      ? ThemeData(
                          brightness: Brightness.light,
                          scaffoldBackgroundColor: AppColors.white,
                          bottomNavigationBarTheme:
                              const BottomNavigationBarThemeData(
                            backgroundColor: AppColors.white,
                          ),
                        )
                      : ThemeData(
                          //brightness: Brightness.dark,
                          colorScheme: const ColorScheme(
                            brightness: Brightness.dark,
                            primary: AppColors.primary,
                            onPrimary: AppColors.primary,
                            secondary: AppColors.secondry,
                            onSecondary: AppColors.secondry,
                            error: Colors.red,
                            onError: Colors.red,
                            surface: AppColors.primary,
                            onSurface: AppColors.primary,
                          ),
                          // colorSchemeSeed: AppColors.primary.withOpacity(0.8),
                          scaffoldBackgroundColor: AppColors.primary,
                          bottomNavigationBarTheme:
                              const BottomNavigationBarThemeData(
                            backgroundColor: AppColors.primary,
                          ),
                        ),
                  onGenerateRoute: AppRouter.generateRoute,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
