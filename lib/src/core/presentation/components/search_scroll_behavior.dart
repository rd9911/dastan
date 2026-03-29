import 'package:flutter/material.dart';

/// Configuration for search screen scroll behavior.
///
/// Use this to customize how [UnifiedSearchScaffold] handles scrolling,
/// form collapse, and position restoration.
///
/// Predefined presets:
/// - [SearchScrollBehavior.simple] - Basic scrolling, no auto-collapse
/// - [SearchScrollBehavior.advanced] - Full features for complex forms
@immutable
class SearchScrollBehavior {
  /// Whether to auto-collapse the form when results are loaded.
  final bool autoCollapseOnResults;

  /// Whether to save/restore scroll position on navigation.
  final bool saveScrollPosition;

  /// Whether to show animated header opacity on scroll.
  final bool animatedHeaderOpacity;

  /// Whether to show the expand/collapse toggle button.
  final bool showCollapseToggle;

  /// Scroll offset at which title starts fading in.
  final double titleFadeStartOffset;

  /// Scroll offset at which title is fully visible.
  final double titleFadeEndOffset;

  /// Duration for collapse/expand animation.
  final Duration collapseAnimationDuration;

  /// Curve for collapse/expand animation.
  final Curve collapseAnimationCurve;

  const SearchScrollBehavior({
    this.autoCollapseOnResults = false,
    this.saveScrollPosition = false,
    this.animatedHeaderOpacity = true,
    this.showCollapseToggle = true,
    this.titleFadeStartOffset = 100.0,
    this.titleFadeEndOffset = 200.0,
    this.collapseAnimationDuration = const Duration(milliseconds: 300),
    this.collapseAnimationCurve = Curves.easeInOut,
  });

  /// Simple behavior: basic scrolling without advanced features.
  ///
  /// Use for screens with simple forms that don't need position saving
  /// or auto-collapse (Entertainment, Events, Gastronomy, Trails).
  static const simple = SearchScrollBehavior(
    autoCollapseOnResults: false,
    saveScrollPosition: false,
    showCollapseToggle: true,
  );

  /// Advanced behavior: full scroll management features.
  ///
  /// Use for screens with complex forms, tabs, or long result lists
  /// that benefit from position restoration (Transport, Accommodation).
  static const advanced = SearchScrollBehavior(
    autoCollapseOnResults: true,
    saveScrollPosition: true,
    showCollapseToggle: true,
  );

  /// Minimal behavior: no collapse controls at all.
  ///
  /// Use for very simple screens that shouldn't have form collapse.
  static const minimal = SearchScrollBehavior(
    autoCollapseOnResults: false,
    saveScrollPosition: false,
    showCollapseToggle: false,
  );

  /// Creates a copy with the given fields replaced.
  SearchScrollBehavior copyWith({
    bool? autoCollapseOnResults,
    bool? saveScrollPosition,
    bool? animatedHeaderOpacity,
    bool? showCollapseToggle,
    double? titleFadeStartOffset,
    double? titleFadeEndOffset,
    Duration? collapseAnimationDuration,
    Curve? collapseAnimationCurve,
  }) {
    return SearchScrollBehavior(
      autoCollapseOnResults:
          autoCollapseOnResults ?? this.autoCollapseOnResults,
      saveScrollPosition: saveScrollPosition ?? this.saveScrollPosition,
      animatedHeaderOpacity:
          animatedHeaderOpacity ?? this.animatedHeaderOpacity,
      showCollapseToggle: showCollapseToggle ?? this.showCollapseToggle,
      titleFadeStartOffset: titleFadeStartOffset ?? this.titleFadeStartOffset,
      titleFadeEndOffset: titleFadeEndOffset ?? this.titleFadeEndOffset,
      collapseAnimationDuration:
          collapseAnimationDuration ?? this.collapseAnimationDuration,
      collapseAnimationCurve:
          collapseAnimationCurve ?? this.collapseAnimationCurve,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchScrollBehavior &&
        other.autoCollapseOnResults == autoCollapseOnResults &&
        other.saveScrollPosition == saveScrollPosition &&
        other.animatedHeaderOpacity == animatedHeaderOpacity &&
        other.showCollapseToggle == showCollapseToggle &&
        other.titleFadeStartOffset == titleFadeStartOffset &&
        other.titleFadeEndOffset == titleFadeEndOffset &&
        other.collapseAnimationDuration == collapseAnimationDuration &&
        other.collapseAnimationCurve == collapseAnimationCurve;
  }

  @override
  int get hashCode => Object.hash(
    autoCollapseOnResults,
    saveScrollPosition,
    animatedHeaderOpacity,
    showCollapseToggle,
    titleFadeStartOffset,
    titleFadeEndOffset,
    collapseAnimationDuration,
    collapseAnimationCurve,
  );
}
