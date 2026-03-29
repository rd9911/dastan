import 'package:flutter/material.dart';

class CommonSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  final Color? backgroundColor;

  CommonSliverPersistentHeaderDelegate({
    required this.child,
    required this.height,
    this.backgroundColor,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(
    covariant CommonSliverPersistentHeaderDelegate oldDelegate,
  ) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}
