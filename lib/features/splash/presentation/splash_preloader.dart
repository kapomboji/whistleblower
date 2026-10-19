import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class SplashPreloader extends StatefulWidget {
  const SplashPreloader({
    super.key,
    this.size = 142,
    this.logoSize = 60,
  });

  final double size;
  final double logoSize;

  @override
  State<SplashPreloader> createState() => _SplashPreloaderState();
}

class _SplashPreloaderState extends State<SplashPreloader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: _rotationController,
            child: SizedBox(
              width: widget.size - 12,
              height: widget.size - 12,
              child: const CustomPaint(painter: _SplashPreloaderRingPainter()),
            ),
          ),
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
            height: widget.logoSize,
            width: widget.logoSize,
          ),
        ],
      ),
    );
  }
}

class _SplashPreloaderRingPainter extends CustomPainter {
  const _SplashPreloaderRingPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final bounds = Offset.zero & size;
    final strokeBounds = bounds.deflate(2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..shader = const SweepGradient(
        colors: [
          AppColors.darkBlue,
          AppColors.background,
          AppColors.neutralTransparent,
        ],
        stops: [0, 0.56, 1],
      ).createShader(bounds);

    canvas.drawArc(strokeBounds, -0.9, 4.65, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
