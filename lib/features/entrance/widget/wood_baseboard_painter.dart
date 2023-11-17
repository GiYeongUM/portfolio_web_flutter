import 'package:flutter/material.dart';

class WoodKnightBaseboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF8B4513) // 진한 나무색
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)), paint);

    // 나무 나이트 스타일 패턴 그리기
    paint.strokeWidth = 1.0;
    paint.color = Colors.brown; // 나뭇결의 색상

    for (double i = 0; i < size.width; i += 8) {
      for (double j = 0; j < size.height; j += 8) {
        // 나무 나이트 스타일의 나뭇결 패턴을 그립니다.
        canvas.drawRect(Rect.fromPoints(Offset(i, j), Offset(i + 4, j + 4)), paint);
        canvas.drawRect(Rect.fromPoints(Offset(i + 4, j + 4), Offset(i + 8, j + 8)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
