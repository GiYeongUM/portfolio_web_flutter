import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key, required this.enabled, required this.child}) : super(key: key);

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if(!enabled) return child;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: enabled,
      child: child,
    );
  }
}
