import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/core.dart';

import '../../main/widget/main_entrance_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Hej!',
                style: context.textTheme.krSubtitle1.copyWith(color: Colors.red, fontSize: (context.textTheme.krSubtitle1.fontSize ?? 16)),
              ),
              const Spacer(),
              const SizedBox(height: 16),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.5) / 4,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.height * 0.5) / 4,
                      decoration: const BoxDecoration(
                        color: Color(0xffCFC3B2),
                        border: Border(
                          top: BorderSide(color: wood, width: 40),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 32,
                      decoration: BoxDecoration(color: white, boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, -3),
                        ),
                      ]),
                      child: CustomPaint(
                        painter: WoodKnightBaseboardPainter(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
