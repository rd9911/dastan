import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A horizontal scrollable strip of dates for quick navigation.
class DateStrip extends StatefulWidget {
  final DateTime selectedDate;
  final DateTime startDate;
  final DateTime endDate;
  final void Function(DateTime date) onDateSelected;

  const DateStrip({
    super.key,
    required this.selectedDate,
    required this.startDate,
    required this.endDate,
    required this.onDateSelected,
  });

  @override
  State<DateStrip> createState() => _DateStripState();
}

class _DateStripState extends State<DateStrip> {
  late ScrollController _scrollController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DateStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _scrollToSelected();
    }
  }

  void _scrollToSelected() {
    final dayIndex = widget.selectedDate.difference(widget.startDate).inDays;
    if (dayIndex >= 0 && _scrollController.hasClients) {
      final offset =
          (dayIndex * 72.0) - (MediaQuery.of(context).size.width / 2) + 36;
      _scrollController.animateTo(
        offset.clamp(0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      DateTime newDate = widget.selectedDate;
      if (event.logicalKey == LogicalKeyboardKey.comma ||
          event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        newDate = widget.selectedDate.subtract(const Duration(days: 1));
      } else if (event.logicalKey == LogicalKeyboardKey.period ||
          event.logicalKey == LogicalKeyboardKey.arrowRight) {
        newDate = widget.selectedDate.add(const Duration(days: 1));
      }

      if (!newDate.isBefore(widget.startDate) &&
          !newDate.isAfter(widget.endDate)) {
        widget.onDateSelected(newDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dayCount = widget.endDate.difference(widget.startDate).inDays + 1;

    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: Container(
        height: 80,
        color: Theme.of(context).colorScheme.surface,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: dayCount,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            final date = widget.startDate.add(Duration(days: index));
            final isSelected = _isSameDay(date, widget.selectedDate);
            final isToday = _isSameDay(date, DateTime.now());

            return GestureDetector(
              onTap: () => widget.onDateSelected(date),
              child: Container(
                width: 64,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : (isToday
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null),
                  borderRadius: BorderRadius.circular(12),
                  border: isToday && !isSelected
                      ? Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        )
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _dayName(date),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${date.day}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _dayName(DateTime date) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }
}
