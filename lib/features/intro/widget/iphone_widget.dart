import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/core.dart';

class IPhoneWidget extends StatelessWidget {
  const IPhoneWidget({Key? key, this.child = const SizedBox()}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1300 / 2640,
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(210),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 12,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: IPhonePhysicalButton(
              constraints: constraints,
              child: Container(
                decoration: ShapeDecoration(
                  color: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(180 * constraints.maxWidth / 1320),
                  ),
                ),
                child: IPhoneFrame(
                  constraints: constraints,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 48 * constraints.maxWidth / 1320),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(flex: 1, child: Center(child: IPhoneTime(constraints: constraints))),
                          Expanded(flex: 1, child: IPhoneDynamicIsland(constraints: constraints)),
                          Expanded(flex: 1, child: Center(child: IPhoneStatusBar(constraints: constraints))),
                        ],
                      ),
                      SizedBox(height: 80 * constraints.maxWidth / 1320),
                      Expanded(
                        child: child,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80 * constraints.maxWidth / 1320),
                          color: black.withOpacity(0.3),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 24 * constraints.maxWidth / 1320),
                        height: 300 * constraints.maxWidth / 1320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/icons/ic_phone.png"),
                            const SizedBox(width: 16),
                            Image.asset("assets/icons/ic_message.png"),
                            const SizedBox(width: 16),
                            Image.asset("assets/icons/ic_safari.png"),
                            const SizedBox(width: 16),
                            Image.asset("assets/icons/ic_kakao.png"),
                          ],
                        ),
                      ),
                      SizedBox(height: 80 * constraints.maxWidth / 1320),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}

class IPhonePhysicalButton extends StatelessWidget {
  const IPhonePhysicalButton({Key? key, required this.child, required this.constraints}) : super(key: key);

  final Widget child;

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: 538 * constraints.maxWidth / 1320),
            IPhoneMuteButton(constraints: constraints),
            SizedBox(height: 92 * constraints.maxWidth / 1320),
            IphoneVolumeButton(constraints: constraints),
          ],
        ),
        Expanded(child: child),
        Column(
          children: [
            SizedBox(height: 800 * constraints.maxWidth / 1320),
            IPhonePowerButton(constraints: constraints),
          ],
        ),
      ],
    );
  }
}

class IPhonePowerButton extends StatelessWidget {
  const IPhonePowerButton({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10 * constraints.maxWidth / 1320,
      height: 314 * constraints.maxWidth / 1320,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2),
            bottomRight: Radius.circular(2),
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 1,
            top: 1,
            child: Container(
              width: 10 * constraints.maxWidth / 1320,
              height: 312 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                color: const Color(0xFFDEDEDE),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              width: 8 * constraints.maxWidth / 1320,
              height: 310 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFFAFAF8),
                  ),
                  borderRadius: BorderRadius.circular(0.20),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              width: 9 * constraints.maxWidth / 1320,
              height: 22 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.50),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 312,
            child: Container(
              width: 9 * constraints.maxWidth / 1320,
              height: 22 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IPhoneMuteButton extends StatelessWidget {
  const IPhoneMuteButton({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10 * constraints.maxWidth / 1320,
      height: 97 * constraints.maxWidth / 1320,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            bottomLeft: Radius.circular(2),
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 1,
            top: 1,
            child: Container(
              width: 10 * constraints.maxWidth / 1320,
              height: 95 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                color: const Color(0xFFDEDEDE),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              width: 8 * constraints.maxWidth / 1320,
              height: 93 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFFAFAF8),
                  ),
                  borderRadius: BorderRadius.circular(0.20),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              width: 9 * constraints.maxWidth / 1320,
              height: 11 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.50),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2,
            top: 95,
            child: Container(
              width: 9 * constraints.maxWidth / 1320,
              height: 11 * constraints.maxWidth / 1320,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IphoneVolumeButton extends StatelessWidget {
  const IphoneVolumeButton({Key? key, required this.constraints}) : super(key: key);
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 10 * constraints.maxWidth / 1320,
          height: 202 * constraints.maxWidth / 1320,
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 1,
                top: 1,
                child: Container(
                  width: 10 * constraints.maxWidth / 1320,
                  height: 200 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDEDEDE),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 2,
                child: Container(
                  width: 8 * constraints.maxWidth / 1320,
                  height: 198 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFFAFAF8),
                      ),
                      borderRadius: BorderRadius.circular(0.20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 2,
                child: Container(
                  width: 9 * constraints.maxWidth / 1320,
                  height: 22 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 200,
                child: Container(
                  width: 9 * constraints.maxWidth / 1320,
                  height: 22 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 52 * constraints.maxWidth / 1320),
        Container(
          width: 10 * constraints.maxWidth / 1320,
          height: 202 * constraints.maxWidth / 1320,
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                bottomLeft: Radius.circular(2),
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 1,
                top: 1,
                child: Container(
                  width: 10 * constraints.maxWidth / 1320,
                  height: 200 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDEDEDE),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 2,
                child: Container(
                  width: 8 * constraints.maxWidth / 1320,
                  height: 198 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFFAFAF8),
                      ),
                      borderRadius: BorderRadius.circular(0.20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 2,
                child: Container(
                  width: 9 * constraints.maxWidth / 1320,
                  height: 22 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 200,
                child: Container(
                  width: 9 * constraints.maxWidth / 1320,
                  height: 22 * constraints.maxWidth / 1320,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF2C2D2A), Color(0xFFDEDEDE)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IPhoneFrame extends StatelessWidget {
  const IPhoneFrame({Key? key, required this.child, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 5, color: Color(0xFF27232D)),
          borderRadius: BorderRadius.circular(180 * constraints.maxWidth / 1320),
        ),
      ),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 5 * constraints.maxWidth / 1320,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: const Color(0xFF89789A).withOpacity(0.9),
            ),
            borderRadius: BorderRadius.circular(178 * constraints.maxWidth / 1320),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: ShapeDecoration(
            color: context.colorTheme.backgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 13 * constraints.maxWidth / 1320, color: const Color(0xFF595163)),
              borderRadius: BorderRadius.circular(176 * constraints.maxWidth / 1320),
            ),
          ),
          child: Container(
            decoration: ShapeDecoration(
              color: context.colorTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: const Color(0xFF646464).withOpacity(0.8),
                ),
                borderRadius: BorderRadius.circular(160 * constraints.maxWidth / 1320),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class IPhoneDynamicIsland extends StatelessWidget {
  const IPhoneDynamicIsland({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth / 3.4,
      child: AspectRatio(
        aspectRatio: 370 / 108,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        ),
      ),
    );
  }
}

class IPhoneTime extends StatelessWidget {
  const IPhoneTime({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Text(
      dateParser(DateTime.now(), pattern: 'HH:mm'),
      style: TextStyle(
        color: context.colorTheme.reverseColor,
        fontSize: 56 * constraints.maxWidth / 1320,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    );
  }
}

class IPhoneStatusBar extends StatelessWidget {
  const IPhoneStatusBar({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 32 * constraints.maxWidth / 1320, width: 53 * constraints.maxWidth / 1320, child: SvgImage('assets/icons/ic_cell.svg', color: context.colorTheme.reverseColor)),
        SizedBox(width: 28 * constraints.maxWidth / 1320),
        SizedBox(height: 36 * constraints.maxWidth / 1320, width: 51 * constraints.maxWidth / 1320, child: SvgImage('assets/icons/ic_wifi.svg', color: context.colorTheme.reverseColor)),
        SizedBox(width: 28 * constraints.maxWidth / 1320),
        SizedBox(height: 29 * constraints.maxWidth / 1320, width: 73 * constraints.maxWidth / 1320, child: SvgImage('assets/icons/ic_battery.svg', color: context.colorTheme.reverseColor)),
      ],
    );
  }
}
