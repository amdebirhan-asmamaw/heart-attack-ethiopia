import 'package:flutter/material.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    this.height = 16,
    this.width = double.infinity,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -1, end: 2),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: const [
                Color(0xFFE6EBF3),
                Color(0xFFF5F7FB),
                Color(0xFFE6EBF3),
              ],
              stops: const [0.1, 0.3, 0.4],
              begin: Alignment(value - 1, 0),
              end: Alignment(value, 0),
            ),
          ),
          child: SizedBox(height: height, width: width),
        );
      },
    );
  }
}
