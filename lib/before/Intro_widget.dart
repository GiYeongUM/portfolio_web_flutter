import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/before/theme_data.dart';

import '../model/text_class.dart';
import 'custom_text.dart';

enum Direction { left, right }

class IntroWidget extends StatelessWidget {
  const IntroWidget({Key? key, required this.textList, required this.direction, required this.sideText})
      : super(key: key);

  final Direction direction;
  final List<TextClass> textList;
  final TextClass sideText;

  @override
  Widget build(BuildContext context) {
    return direction == Direction.left
        ? Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(textList.length, (index) {
                          return CustomTextWidget(
                            text: textList[index],
                            style: tileBoldTextStyle,
                            textAlign: TextAlign.right,
                          );
                        }),
                      ),
                    ),
                    Flexible(
                      child: Center(
                        child: CustomTextWidget(
                          text: sideText,
                          style: tilePrimaryRegularTextStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ), // image?
                  ],
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Center(
                        child: CustomTextWidget(
                          text: sideText,
                          style: tilePrimaryRegularTextStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ), // image?
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(textList.length, (index) {
                          return CustomTextWidget(
                            text: textList[index],
                            style: tileBoldTextStyle,
                            textAlign: TextAlign.left,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
