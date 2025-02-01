import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainShimmerWidget extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const MainShimmerWidget({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: child,
    );
  }
}
