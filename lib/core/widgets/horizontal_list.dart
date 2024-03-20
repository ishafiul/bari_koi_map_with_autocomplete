import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Widget for displaying a horizontal list of items.
///
/// The [HorizontalList] widget is useful when you don't want to give
/// a fixed height to each item.
class HorizontalList extends StatelessWidget {
  /// The number of items in the list.
  final int itemCount;

  /// A builder function that returns a widget for each item in the list.
  final IndexedWidgetBuilder itemBuilder;

  /// The spacing between items in the list.
  final double? spacing;

  /// The run spacing between lines of items in the list.
  final double? runSpacing;

  /// The padding around the list.
  final EdgeInsets? padding;

  /// The physics of the scrollable area.
  final ScrollPhysics? physics;

  /// Whether the scroll view scrolls in the reading direction.
  final bool reverse;

  /// An object that can be used to control the position to which this
  /// scroll view is scrolled.
  final ScrollController? controller;

  /// The alignment of items within the run.
  final WrapAlignment? wrapAlignment;

  /// The alignment of items across the main axis.
  final WrapCrossAlignment? crossAxisAlignment;

  /// Widget for displaying a horizontal list of items.
  ///
  /// The [HorizontalList] widget is useful when you don't want to give
  /// a fixed height to each item.
  const HorizontalList({
    required this.itemCount,
    required this.itemBuilder,
    this.spacing,
    this.runSpacing,
    this.padding,
    this.physics,
    this.controller,
    this.reverse = false,
    this.wrapAlignment,
    this.crossAxisAlignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: physics,
      padding: padding ?? EdgeInsets.all(16.w),
      scrollDirection: Axis.horizontal,
      reverse: reverse,
      controller: controller,
      child: Wrap(
        spacing: spacing ?? 8.w,
        runSpacing: runSpacing ?? 16.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        runAlignment: wrapAlignment ?? WrapAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
        children:
        List.generate(itemCount, (index) => itemBuilder(context, index)),
      ),
    );
  }
}
