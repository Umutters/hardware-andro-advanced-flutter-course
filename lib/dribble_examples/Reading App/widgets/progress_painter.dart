import 'package:flutter/material.dart';
import 'dart:math';

class ProgressPainter extends CustomPainter {
  final double progress; // 0.0 ile 1.0 arası

  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Kalemimizi (Paint) hazırlayalım
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Uçları yuvarlak yapar

    // 2. Arka plandaki sönük halkayı çizelim
    final backgroundPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundPaint);

    // 3. İlerleme yayını (Arc) çizelim
    // Flutter'da 0 derece saat 3 yönüdür. -pi/2 yaparak saat 12'den başlatıyoruz.
    double sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
