import 'package:ana_muslim/core/cubit/nav_b_ar_cubit.dart';
import 'package:ana_muslim/features/home/presentation/controllers/cubit/home_cubit_cubit.dart';
import 'package:ana_muslim/features/home/presentation/views/home_page_view.dart';
import 'package:ana_muslim/features/qiblah/presentation/cubit/qibla_cubit.dart';
import 'package:ana_muslim/features/qiblah/presentation/qiblah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../../../setting/presentation/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _views = [
    const HomePageView(),
    BlocProvider<QiblaCubit>(
      create: (context) => QiblaCubit(),
      child: const QiblahView(),
    ),
    BlocProvider<HomeCubitCubit>(
      create: (context) => HomeCubitCubit()..getAllPreyTime(),
      child: const SettingsView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBAr(),
      body: BlocBuilder<NavBArCubit, int>(
        builder: (context, state) => _views[state],
      ),
    );
  }
}
