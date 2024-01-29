import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

const shimmerDuration = Duration(seconds: 2);
const shimmerInterval = Duration(microseconds: 500);

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: shimmerDuration,
      interval: shimmerInterval,
      color: Colors.grey,
      child: child,
    );
  }
}
