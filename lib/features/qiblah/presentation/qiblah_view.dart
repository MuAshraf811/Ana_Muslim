import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QiblahView extends StatelessWidget {
  const QiblahView({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).height;
    // final width = MediaQuery.sizeOf(context).height;

    return Center(
      child: CustomPaint(
        painter: CompassPainter(),
      ),
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
    final redPainter = Paint()
      ..color = AppColors.offRed
      ..strokeWidth = 2.w
      ..style = PaintingStyle.stroke
      ..strokeMiterLimit = BorderSide.strokeAlignCenter
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.butt;
    final whitePainter = Paint()
      ..color = AppColors.white
      ..strokeWidth = 5.w
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 140.w, greyPainter);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: 140.w),
        3 * 3.14 / 2.15,
        -3.14 / 3.5,
        true,
        whitePainter);
    canvas.clipPath(path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
