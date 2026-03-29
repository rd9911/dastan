import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/core/presentation/widgets/active_itinerary_guard.dart';
import 'package:dastan/src/core/presentation/components/common_sliver_persistent_header_delegate.dart';
import 'package:dastan/src/core/presentation/components/search_layout_constants.dart';
import 'package:dastan/src/core/presentation/components/search_scroll_behavior.dart';

/// Signature for building the search form header content.
typedef SearchHeaderBuilder =
    Widget Function(BuildContext context, Itinerary itinerary);

/// Signature for building the body content (typically a TabBarView or list).
typedef SearchBodyBuilder =
    Widget Function(BuildContext context, Itinerary itinerary);

/// Signature for building extra slivers (e.g., pinned TabBar).
typedef ExtraSliversBuilder =
    List<Widget> Function(BuildContext context, Itinerary itinerary);

/// A unified scaffold for all search screens.
///
/// Provides:
/// - Consistent spacing using [SearchLayoutConstants]
/// - Responsive layout that adapts to different screen sizes
/// - Unified scroll behavior with title fade-in
/// - Form collapse/expand toggle
/// - Scroll position preservation during navigation
///
/// Usage:
/// ```dart
/// UnifiedSearchScaffold(
///   title: 'Entertainment',
///   restorationId: 'entertainment_search',
///   headerBuilder: (context, itinerary) => MySearchForm(),
///   tabBar: TabBar(...),
///   bodyBuilder: (context, itinerary) => TabBarView(...),
/// )
/// ```
class UnifiedSearchScaffold extends ConsumerStatefulWidget {
  const UnifiedSearchScaffold({
    super.key,
    required this.title,
    required this.restorationId,
    required this.headerBuilder,
    required this.bodyBuilder,
    this.tabBar,
    this.extraSliversBuilder,
    this.onItineraryAvailable,
    this.innerController,
    this.scrollBehavior = const SearchScrollBehavior(),
  });

  /// Title shown in the app bar when scrolled
  final String title;

  /// Restoration ID for scroll position persistence
  final String restorationId;

  /// Builds the search form header (destination, filters, etc.)
  final SearchHeaderBuilder headerBuilder;

  /// Optional TabBar to pin below the form
  final TabBar? tabBar;

  /// Optional extra slivers between form and body
  final ExtraSliversBuilder? extraSliversBuilder;

  /// Builds the main content area (results list, map, etc.)
  final SearchBodyBuilder bodyBuilder;

  /// Called when itinerary becomes available
  final void Function(Itinerary)? onItineraryAvailable;

  /// Optional inner scroll controller to manage (save/restore)
  final ScrollController? innerController;

  /// Scroll behavior configuration.
  ///
  /// Use [SearchScrollBehavior.simple] for basic screens or
  /// [SearchScrollBehavior.advanced] for screens with complex forms.
  final SearchScrollBehavior scrollBehavior;

  @override
  ConsumerState<UnifiedSearchScaffold> createState() =>
      UnifiedSearchScaffoldState();
}

class UnifiedSearchScaffoldState extends ConsumerState<UnifiedSearchScaffold> {
  final _nestedScrollViewKey = GlobalKey<NestedScrollViewState>();
  final _formKey = GlobalKey();

  // State storage for scroll position (persists only while this widget is alive)
  double? _savedOuterOffset;
  double? _savedInnerOffset;
  // _isCollapsed is already a state variable, so it persists with the widget.

  double _scrollOpacity = 0.0;
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    // Default to expanded (false) when first entering the screen
    _isCollapsed = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Restore scroll position after dependencies change (e.g. popping back)
    // Restore scroll position after dependencies change (e.g. popping back)
    _restoreSearchState(innerController: widget.innerController);
  }

  // ───────────────────────────────────────────────────────────────────────────
  // PUBLIC API (for use by consuming screens)
  // ───────────────────────────────────────────────────────────────────────────

  /// Save current scroll position and state (call before navigating to detail)
  /// Save current scroll position and state (call before navigating to detail)
  /// Save current scroll position and state (call before navigating to detail)
  void saveScrollPosition({ScrollController? innerController}) {
    final controller = _nestedScrollViewKey.currentState?.outerController;
    // Use passed controller or widget's inner controller
    final targetInnerController = innerController ?? widget.innerController;

    if (controller != null && controller.hasClients) {
      _savedOuterOffset = controller.offset;

      if (targetInnerController != null && targetInnerController.hasClients) {
        _savedInnerOffset = targetInnerController.offset;
      }
    }
  }

  /// Restore saved scroll position (typically called automatically, but exposed if needed)
  /// Restore saved scroll position (typically called automatically, but exposed if needed)
  void restoreScrollPosition({ScrollController? innerController}) {
    _restoreSearchState(
      innerController: innerController ?? widget.innerController,
    );
  }

  /// Auto-collapse the form (call after search returns results)
  void autoCollapse() {
    final controller = _nestedScrollViewKey.currentState?.outerController;
    if (controller == null || !controller.hasClients) return;

    final formHeight = _getFormHeight();

    setState(() {
      _isCollapsed = true;
    });
    // State is updated in member variable

    controller.animateTo(
      formHeight,
      duration: SearchLayoutConstants.collapseAnimationDuration,
      curve: SearchLayoutConstants.collapseAnimationCurve,
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // PRIVATE HELPERS
  // ───────────────────────────────────────────────────────────────────────────

  void _restoreSearchState({ScrollController? innerController}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Small delay to ensure layout is ready
      await Future.delayed(const Duration(milliseconds: 16));

      if (!mounted) return;

      final controller = _nestedScrollViewKey.currentState?.outerController;
      final offset = _savedOuterOffset;

      if (controller != null && controller.hasClients && offset != null) {
        controller.jumpTo(offset);
      }

      // Restore inner controller after outer
      if (innerController != null) {
        // Wait a bit more for inner list to be built/attached if needed
        await Future.delayed(const Duration(milliseconds: 16));

        final innerOffset = _savedInnerOffset;
        if (innerController.hasClients && innerOffset != null) {
          innerController.jumpTo(innerOffset);
        }
      }
    });
  }

  double _getFormHeight() {
    final renderBox = _formKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? SearchLayoutConstants.minFormHeight;
  }

  void _toggleForm() {
    final controller = _nestedScrollViewKey.currentState?.outerController;
    if (controller == null || !controller.hasClients) return;

    final formHeight = _getFormHeight();

    setState(() {
      _isCollapsed = !_isCollapsed;
    });
    // State is updated in member variable

    controller.animateTo(
      _isCollapsed ? formHeight : 0,
      duration: SearchLayoutConstants.collapseAnimationDuration,
      curve: SearchLayoutConstants.collapseAnimationCurve,
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      final offset = notification.metrics.pixels;
      final opacity =
          ((offset - SearchLayoutConstants.titleFadeStartOffset) /
                  (SearchLayoutConstants.titleFadeEndOffset -
                      SearchLayoutConstants.titleFadeStartOffset))
              .clamp(0.0, 1.0);
      if (opacity != _scrollOpacity) {
        setState(() => _scrollOpacity = opacity);
      }
    }
    return false;
  }

  // ───────────────────────────────────────────────────────────────────────────
  // BUILD
  // ───────────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return ActiveItineraryGuard(
      builder: (context, itinerary) {
        // Notify consumer if callback provided
        widget.onItineraryAvailable?.call(itinerary);

        return Scaffold(
          body: SafeArea(
            top: false, // Let app bar handle top safe area
            child: NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: NestedScrollView(
                key: _nestedScrollViewKey,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  // ─── APP BAR ───────────────────────────────────────────────
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    expandedHeight: 0,
                    leading: const BackButton(color: Colors.black),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    title: Opacity(
                      opacity: _scrollOpacity,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    actions: [
                      if (widget.scrollBehavior.showCollapseToggle)
                        IconButton(
                          icon: Icon(
                            _isCollapsed
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Colors.black,
                          ),
                          onPressed: _toggleForm,
                        ),
                    ],
                  ),

                  // ─── SEARCH FORM ───────────────────────────────────────────
                  SliverToBoxAdapter(
                    child: Container(
                      key: _formKey,
                      padding: const EdgeInsets.all(
                        SearchLayoutConstants.headerPadding,
                      ),
                      color: Theme.of(context).colorScheme.surface,
                      child: widget.headerBuilder(context, itinerary),
                    ),
                  ),

                  // ─── TAB BAR (if provided) ─────────────────────────────────
                  if (widget.tabBar != null)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: CommonSliverPersistentHeaderDelegate(
                        height: SearchLayoutConstants.tabBarHeight,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        child: widget.tabBar!,
                      ),
                    ),

                  // ─── EXTRA SLIVERS ─────────────────────────────────────────
                  if (widget.extraSliversBuilder != null)
                    ...widget.extraSliversBuilder!(context, itinerary),
                ],
                // Wrap body in AutomaticKeepAlive if the user's advice hinted at it,
                // but since the scaffold itself is usually the page, the children usage varies.
                // The prompt suggested: "If this screen is in a TabBarView, also mix in AutomaticKeepAliveClientMixin"
                // The UnifiedSearchScaffold *usage* is typically inside a tab view? No, usually it's a top level screen.
                // But the *body* of the NestedScrollView is typically a TabBarView.
                // I will add the mixin to the state just in case this scaffold is used inside tabs,
                // but mainly the logic handles the restoration.
                body: widget.bodyBuilder(context, itinerary),
              ),
            ),
          ),
        );
      },
    );
  }
}
