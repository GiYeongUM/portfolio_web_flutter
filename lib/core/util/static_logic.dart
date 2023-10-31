import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateParser(DateTime? date, {String? pattern}) {
  if (date == null) return '';
  return DateFormat(pattern ?? 'yyyy년 MM월 dd일', 'ko_kr').format(date);
}

DateTime dateFormatter(String? date) {
  if (date == null) return DateTime.now().toUtc();
  final result = date.replaceAll(RegExp(r'[년월일]'), '-').replaceAll(' ', '');
  return DateTime.parse(result).toUtc();
}


String numberFormatter(int? number) {
  if (number == null) {
    return '-';
  }
  return NumberFormat('###,###,###,###').format(number);
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final minute = this.minute.toString().padLeft(2, "0");
    return "$hour:$minute";
  }
}




