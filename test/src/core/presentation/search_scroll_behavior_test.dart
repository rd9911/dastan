import 'package:flutter_test/flutter_test.dart';

import 'package:dastan/src/core/presentation/components/search_scroll_behavior.dart';

void main() {
  group('SearchScrollBehavior', () {
    group('presets', () {
      test('simple preset has correct defaults', () {
        const behavior = SearchScrollBehavior.simple;
        expect(behavior.autoCollapseOnResults, isFalse);
        expect(behavior.saveScrollPosition, isFalse);
        expect(behavior.showCollapseToggle, isTrue);
      });

      test('advanced preset enables all features', () {
        const behavior = SearchScrollBehavior.advanced;
        expect(behavior.autoCollapseOnResults, isTrue);
        expect(behavior.saveScrollPosition, isTrue);
        expect(behavior.showCollapseToggle, isTrue);
      });

      test('minimal preset hides collapse toggle', () {
        const behavior = SearchScrollBehavior.minimal;
        expect(behavior.autoCollapseOnResults, isFalse);
        expect(behavior.saveScrollPosition, isFalse);
        expect(behavior.showCollapseToggle, isFalse);
      });
    });

    group('default constructor', () {
      test('has correct default values', () {
        const behavior = SearchScrollBehavior();
        expect(behavior.autoCollapseOnResults, isFalse);
        expect(behavior.saveScrollPosition, isFalse);
        expect(behavior.animatedHeaderOpacity, isTrue);
        expect(behavior.showCollapseToggle, isTrue);
        expect(behavior.titleFadeStartOffset, equals(100.0));
        expect(behavior.titleFadeEndOffset, equals(200.0));
        expect(
          behavior.collapseAnimationDuration,
          equals(const Duration(milliseconds: 300)),
        );
      });
    });

    group('copyWith', () {
      test('creates copy with modified values', () {
        const original = SearchScrollBehavior.simple;
        final modified = original.copyWith(
          autoCollapseOnResults: true,
          saveScrollPosition: true,
        );

        expect(modified.autoCollapseOnResults, isTrue);
        expect(modified.saveScrollPosition, isTrue);
        // Unchanged values preserved
        expect(
          modified.showCollapseToggle,
          equals(original.showCollapseToggle),
        );
        expect(
          modified.animatedHeaderOpacity,
          equals(original.animatedHeaderOpacity),
        );
      });

      test('preserves original when no changes', () {
        const original = SearchScrollBehavior.advanced;
        final copy = original.copyWith();
        expect(copy, equals(original));
      });
    });

    group('equality', () {
      test('equal instances are equal', () {
        const a = SearchScrollBehavior(
          autoCollapseOnResults: true,
          saveScrollPosition: true,
        );
        const b = SearchScrollBehavior(
          autoCollapseOnResults: true,
          saveScrollPosition: true,
        );
        expect(a, equals(b));
        expect(a.hashCode, equals(b.hashCode));
      });

      test('different instances are not equal', () {
        const a = SearchScrollBehavior.simple;
        const b = SearchScrollBehavior.advanced;
        expect(a, isNot(equals(b)));
      });
    });
  });
}
