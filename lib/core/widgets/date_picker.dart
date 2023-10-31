import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../config/config.dart';

class DatePicker extends StatefulWidget {
  final DateTime startDate;
  final DatePickerController? controller;
  final DateTime? initialSelectedDate;
  final DateChangeListener? onDateChange;
  final DateChangeListener? onScrollChanged;
  final String locale;

  const DatePicker(
    this.startDate, {
    super.key,
    this.controller,
    this.initialSelectedDate,
    this.onDateChange,
    this.onScrollChanged,
    this.locale = "en_US",
  });

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _currentDate;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    initializeDateFormatting(widget.locale, null);
    _currentDate = widget.initialSelectedDate;
    _controller.addListener(() {
      final date =
          widget.controller?.calculateDateFromOffset(_controller.offset);
      widget.onScrollChanged?.call(date ?? widget.startDate);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        // itemCount: widget.datums.length,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemBuilder: (context, index) {
          DateTime date;
          DateTime setDate = widget.startDate.add(Duration(days: index));
          date = DateTime(setDate.year, setDate.month, setDate.day);
          bool isSelected =
              _currentDate != null ? _compareDate(date, _currentDate!) : false;
          return DateWidget(
            // datum: widget.datums[index],
            locale: widget.locale,
            isSelected: isSelected,
            onDateSelected: (selectedDate) {
              widget.onDateChange?.call(selectedDate);
              setState(() {
                _currentDate = selectedDate;
              });
            },
          );
        },
      ),
    );
  }

  bool _compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }
}

class DatePickerController {
  final DateTime startDate;
  final double width;

  const DatePickerController({
    required this.startDate,
    required this.width,
  });

  double calculateDateOffset(DateTime date) {
    final offset = date.difference(startDate).inDays;
    return (offset * width) + (offset * 6);
  }

  DateTime calculateDateFromOffset(double offset) {
    final offsetDays = offset / width;
    final calculatedDate = startDate.add(Duration(days: offsetDays.toInt()));
    return DateTime(
        calculatedDate.year, calculatedDate.month, calculatedDate.day);
  }
}

class DateWidget extends StatelessWidget {
  final bool isSelected;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  const DateWidget({
    super.key,
    required this.isSelected,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? blue1 : Colors.transparent,
                ),
                child: Text('${''}', style: _textStyle(context, false))),
            Text(
              '',
              // DateFormat("E", locale).format(''),
              style: _textStyle(context, true),
            )
          ],
        ),
      ),
    );
  }

  TextStyle _textStyle(BuildContext context, bool weekDay) {
    //   if (!(datum.enabled ?? false)) {
    //     /// 비활성화
    //     return context.textTheme.krBody4.copyWith(color: gray1);
    //   }
    //   if (isSelected) {
    //     /// 선택
    //     return weekDay
    //         ? context.textTheme.krBody5.copyWith(color: blue1)
    //         : context.textTheme.krBody5.copyWith(color: white);
    //   }
    //   if (weekDay) {
    //     /// 휴일, 일요일
    //     return context.textTheme.krBody4.copyWith(
    //         color: datum.date?.weekday == DateTime.sunday ||
    //                 (datum.holidayYn ?? false)
    //             ? red1
    //             : null);
    //   }
    return context.textTheme.krBody4;
  }
}
