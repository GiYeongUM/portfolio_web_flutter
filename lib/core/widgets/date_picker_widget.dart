import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import '../util/static_logic.dart';
import 'widget.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    Key? key,
    required this.initialDate,
    this.onDateChange,
    this.onScrollChanged,
    this.scrollPosition,
    this.selectedDate,
  }) : super(key: key);

  final DateTime? initialDate;
  final DateTime? scrollPosition;
  final DateTime? selectedDate;
  final DateChangeListener? onDateChange;
  final DateChangeListener? onScrollChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorTheme.foregroundColor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                if (scrollPosition != null) Text('${scrollPosition?.month}월', style: context.textTheme.krSubtitle2),
                const Spacer(),
                Text(dateParser(selectedDate ?? initialDate ?? DateTime.now(), pattern: 'yyyy. MM. dd (E)'), style: context.textTheme.krBody4),
              ],
            ),
          ),
          const SizedBox(height: 16),
          DatePicker(
            initialDate ?? DateTime.now(),
            initialSelectedDate: initialDate,
            controller: DatePickerController(startDate: initialDate ?? DateTime.now(), width: 70),
            locale: 'ko_Kr',
            onDateChange: (date) => onDateChange?.call(date),
            onScrollChanged: (date) => onScrollChanged?.call(date),
          ),
        ],
      ),
    );
  }
}
