// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/utils/extensions.dart';
import 'package:ana_muslim/core/utils/location_handler.dart';
import 'package:ana_muslim/core/utils/location_model.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla_direction/qibla_direction.dart';

class QiblahView extends StatefulWidget {
  const QiblahView({super.key});

  @override
  State<QiblahView> createState() => _QiblahViewState();
}

class _QiblahViewState extends State<QiblahView> {
  manage() async {
    await LocationHandler.manageLocationPermission();
  }

  @override
  void initState() {
    manage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).height;

    return StreamBuilder<LocationModel>(
        stream: LocationHandler.locationStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            log("%%%%%%%%%%%%%%%%%%%%%%%%%");
            log(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final direction = QiblaDirection.find(
                Coordinate(snapshot.data!.latitude, snapshot.data!.longitude));
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
                      SvgHandler(
                        imagePath: 'assets/svgs/compass.svg',
                        height: height / 2.2,
                        width: width / 1.2,
                        color: AppColors.primary,
                      ),
                      Transform.rotate(
                        angle: direction * (3.1415 / 180),
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
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpacer(height: 24),
              const Text("******************"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgHandler(
                      imagePath: 'assets/svgs/compass.svg',
                      height: height / 2.2,
                      width: width / 1.2,
                      color: AppColors.primary,
                    ),
                    Transform.translate(
                      offset: Offset(3.w, 0),
                      child: SvgHandler(
                        imagePath: 'assets/svgs/needle.svg',
                        height: height / 3.4,
                        width: width / 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
