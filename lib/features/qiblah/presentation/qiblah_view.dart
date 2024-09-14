// ignore_for_file: unused_local_variable

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QiblahView extends StatelessWidget {
  const QiblahView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).height;

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VerticalSpacer(height: 24),
        Container(
          width: width / 3,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryBlueDarker)),
          child: const Text(
            ' فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَامِ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        const VerticalSpacer(height: 32),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'فاقوس الشرقية',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              ' محل إقامتك ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const VerticalSpacer(height: 32),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: height / 2,
              color: AppColors.homeScaffoldContainer.withOpacity(0.3),
            ),
            Positioned(
              left: width / 4,
              top: height / 4,
              child: CustomPaint(
                painter: CompassPainter(),
              ),
            ),
          ],
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
