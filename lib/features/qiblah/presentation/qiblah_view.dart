// ignore_for_file: unused_local_variable

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QiblahView extends StatelessWidget {
  const QiblahView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).height;

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
  }
}

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo(24.w, size.height / 2 - 86.h)
      ..quadraticBezierTo(
          6.w, size.height / 2 - 42.h, size.width / 2 - 64.w, size.height / 3);

    final greyPainter = Paint()
      ..color = AppColors.greyText
      ..strokeWidth = 3.5.w
      ..style = PaintingStyle.stroke;

    final greyPainter2 = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4.4.w
      ..style = PaintingStyle.stroke;
    final redPainter = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.w
      ..style = PaintingStyle.fill
      ..strokeMiterLimit = BorderSide.strokeAlignCenter
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.butt;
    final whitePainter = Paint()
      ..color = AppColors.white
      ..strokeWidth = 5.w
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 140.w, greyPainter);

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 16.w, redPainter);
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 17.w, greyPainter2);
    // canvas.drawArc(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 2), radius: 140.w),
    //     3 * 3.14 / 2,
    //     -3.14 / 3,
    //     true,
    //     whitePainter);
    // canvas.clipPath(path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
