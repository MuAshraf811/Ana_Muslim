import 'package:ana_muslim/features/home/presentation/controllers/provider/sebha_provider.dart';
import 'package:ana_muslim/features/home/presentation/views/azkar_view.dart';
import 'package:ana_muslim/features/home/presentation/views/hadith_view.dart';
import 'package:ana_muslim/features/home/presentation/views/home_view.dart';
import 'package:ana_muslim/features/home/presentation/views/prey_time_view.dart';
import 'package:ana_muslim/features/home/presentation/views/sebha_view.dart';
import 'package:ana_muslim/features/home/presentation/views/surahs_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_route_path.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RoutesConstants.surahsView:
        return MaterialPageRoute(
          builder: (context) => const SurahsView(),
        );
      case RoutesConstants.azkarView:
        return MaterialPageRoute(
          builder: (context) => const AzkarView(),
        );
      case RoutesConstants.preyTimesView:
        return MaterialPageRoute(
          builder: (context) => const PreyTimeView(),
        );
      case RoutesConstants.sebhaView:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<SebhaProvider>(
            create: (context) => SebhaProvider(),
            child: const SebhaView(),
          ),
        );

      case RoutesConstants.hadithView:
        return MaterialPageRoute(
          builder: (context) => const HadithView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
    }
  }
}
