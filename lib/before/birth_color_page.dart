import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'birth_color_controller.dart';
import 'theme_data.dart';

class BirthColorPage extends StatelessWidget {
  const BirthColorPage({Key? key}) : super(key: key);



  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: CupertinoColors.systemBackground.resolveFrom(context),
          ),
          height: 216,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }




  @override
  Widget build(BuildContext context) {
    print("is build");
    final BirthColorController _birthColorController = Get.put(BirthColorController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Color", style: buttonTextStyle),
        Obx(() => Container(margin: const EdgeInsets.symmetric(vertical: 32), width: 450, height: 450, color: _birthColorController.color.value)),
        CupertinoButton(
          onPressed: () => _showDialog(
            SizedBox(
              width: 300,
              child: CupertinoDatePicker(
                initialDateTime: _birthColorController.birth.value,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newDate) {
                  _birthColorController.birth.value = newDate;
                  var code_1 = "${_birthColorController.birth.value.year}".replaceRange(0, 2, "");
                  var code_2 = "${_birthColorController.birth.value.month}".length == 1 ? "0${_birthColorController.birth.value.month}" : "${_birthColorController.birth.value.month}";
                  var code_3 = "${_birthColorController.birth.value.day}".length == 1 ? "0${_birthColorController.birth.value.day}" : "${_birthColorController.birth.value.day}";
                  _birthColorController.color.value = HexColor.fromHex('#$code_1$code_2$code_3');
                },
              ),
            ), context,
          ),
          child: Text(
            '${_birthColorController.birth.value.month}-${_birthColorController.birth.value.day}-${_birthColorController.birth.value.year}',
            style: const TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
      ],
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}