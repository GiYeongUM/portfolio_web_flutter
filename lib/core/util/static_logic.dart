import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void onScroll({required ScrollController controller, Function()? onDone, bool edge = false, bool minimum = false}) {
  if (minimum) {
    if (isMinimum(controller, edge: edge)) {
      onDone?.call();
    }
    return;
  }
  if (isMaximum(controller, edge: edge)) {
    onDone?.call();
  }
}

bool isMinimum(ScrollController controller, {bool edge = false}) {
  if (!controller.hasClients) return false;
  if (edge) controller.position.atEdge && controller.position.pixels == 0;
  final minScroll = controller.position.minScrollExtent;
  final currentScroll = controller.offset;
  return currentScroll <= minScroll;
}

bool isMaximum(ScrollController controller, {bool edge = false}) {
  if (!controller.hasClients) return false;
  if (edge) controller.position.atEdge && controller.position.pixels != 0;
  final maxScroll = controller.position.maxScrollExtent;
  final currentScroll = controller.offset;
  return currentScroll == maxScroll;
}

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

String localeToLanguageCode(Locale locale) {
  switch (locale.languageCode) {
    case 'ko':
      return 'Korean';
    case 'en':
      return 'English';
    default:
      return 'Korean';
  }
}
