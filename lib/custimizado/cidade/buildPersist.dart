// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BuldPesisTets extends SliverPersistentHeaderDelegate {
  BuldPesisTets(
      {required double maxExtent,
      required double minExtent,
      required this.builder})
      : _maxExtent = maxExtent,
        _minExtent = minExtent;
  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
