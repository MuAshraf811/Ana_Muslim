import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/core/router/app_router.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
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
          BlocProvider<HomeCubitCubit>(
            create: (context) => HomeCubitCubit()..generateCustomZekr(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
