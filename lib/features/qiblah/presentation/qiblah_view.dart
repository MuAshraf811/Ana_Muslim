// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/services/location_service.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla_direction/qibla_direction.dart';

class QiblahView extends StatefulWidget {
  const QiblahView({super.key});

  @override
  State<QiblahView> createState() => _QiblahViewState();
}

class _QiblahViewState extends State<QiblahView> {
  double heading = 0;
  manage() async {
    await LocationService.handelPermission();
  }

  @override
  void initState() {
    manage();
    FlutterCompass.events?.listen(
      (event) {
        setState(() {
          heading = event.heading!;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).height;
    final direction = QiblaDirection.find(Coordinate(
        LocationService.locationMode.latitude,
        LocationService.locationMode.longitude));

    final distance = QiblaDirection.countDistance(
      Coordinate(
        LocationService.locationMode.latitude,
        LocationService.locationMode.longitude,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VerticalSpacer(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: heading * (pi / 180) * -1,
                child: SvgHandler(
                  imagePath: 'assets/svgs/compass.svg',
                  height: height / 2.2,
                  width: width / 1.2,
                  color: AppColors.primary,
                ),
              ),
              Transform.rotate(
                angle: direction * (pi / 180) * -1,
                child: Transform.translate(
                  offset: Offset(3.w, 0),
                  child: SvgHandler(
                    imagePath: 'assets/svgs/needle.svg',
                    height: height / 3.4,
                    width: width / 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        const VerticalSpacer(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(distance.toString(),
                style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const VerticalSpacer(height: 14),
            const Text(
              "المسافة إلي مكة بالكيلومتر",
              style: TextStyle(color: AppColors.blackText, fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
