import 'package:flutter/animation.dart';

/// Unified spacing and timing constants for all search screens.
///
/// These values ensure consistent layout across different phone sizes
/// and provide a single source of truth for search UI dimensions.
class SearchLayoutConstants {
  SearchLayoutConstants._();

  // ─────────────────────────────────────────────────────────────────────────
  // PADDING & SPACING
  // ─────────────────────────────────────────────────────────────────────────

  /// Horizontal and vertical padding for the search form header
  static const double headerPadding = 16.0;

  /// Spacing between filter chips
  static const double filterChipSpacing = 8.0;

  /// Vertical spacing between form sections (e.g., destination → filters)
  static const double sectionSpacing = 16.0;

  /// Smaller vertical spacing within sections
  static const double innerSectionSpacing = 12.0;

  /// Vertical spacing between result cards
  static const double resultCardSpacing = 12.0;

  /// Horizontal padding for result cards
  static const double resultCardHorizontalPadding = 16.0;

  // ─────────────────────────────────────────────────────────────────────────
  // COMPONENT HEIGHTS
  // ─────────────────────────────────────────────────────────────────────────

  /// Height of the pinned TabBar
  static const double tabBarHeight = 48.0;

  /// Height of horizontal filter chip rows
  static const double filterRowHeight = 40.0;

  /// Minimum height for the search form (used as fallback)
  static const double minFormHeight = 300.0;

  // ─────────────────────────────────────────────────────────────────────────
  // SCROLL BEHAVIOR
  // ─────────────────────────────────────────────────────────────────────────

  /// Scroll offset at which the app bar title starts fading in
  static const double titleFadeStartOffset = 100.0;

  /// Scroll offset at which the app bar title is fully visible
  static const double titleFadeEndOffset = 200.0;

  /// Threshold (as fraction of form height) to consider form collapsed
  static const double collapseThreshold = 0.5;

  // ─────────────────────────────────────────────────────────────────────────
  // ANIMATION DURATIONS
  // ─────────────────────────────────────────────────────────────────────────

  /// Duration for form expand/collapse animation
  static const Duration collapseAnimationDuration = Duration(milliseconds: 400);

  /// Curve for form expand/collapse animation
  static const Curve collapseAnimationCurve = Curves.easeInOut;

  /// Delay before restoring scroll position after navigation
  static const Duration scrollRestoreDelay = Duration(milliseconds: 100);
}
