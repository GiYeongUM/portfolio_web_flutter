import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/core.dart';
import 'package:lottie/lottie.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: TextTitle()),
                  Expanded(
                    flex: 1,
                    child: Lottie.asset(
                      'assets/json/profile_lottie.json',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Lottie.asset(
                'assets/json/arrow_down.json',
                fit: BoxFit.fill,
              ),
            ],
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Lottie.asset(
                  'assets/json/profile_lottie.json',
                  fit: BoxFit.fill,
                ),
              ),
              const Expanded(flex: 1, child: TextTitle()),
              Lottie.asset(
                'assets/json/arrow_down.json',
                fit: BoxFit.fill,
              ),
            ],
          ),
        );
      }
    });
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Developer', style: context.textTheme.krSubtitle1),
        const SizedBox(height: 16),
        Text('GiYeong UM', style: context.textTheme.krPoint1.copyWith(color: context.colorTheme.primaryColor, fontSize: 72)),
        const SizedBox(height: 16),
        Text.rich(
          TextSpan(
            style: context.textTheme.krBody4,
            children: <TextSpan>[
              const TextSpan(text: 'As a '),
              TextSpan(
                text: 'Flutter',
                style: context.textTheme.krSubtitle1,
              ),
              const TextSpan(
                  text:
                      ' developer specializing in multi-platform app development and an expert in implementing stable and efficient backends using NestJS. I focus on creating modern and performance-optimized apps through user-centric UI/UX design and robust server functionalities.'),
            ],
          ),
          style: context.textTheme.krBody4,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 40),
        InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(color: context.colorTheme.primaryColor, borderRadius: BorderRadius.circular(8), boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(2, 4),
                  ),
                ]),
                child: Text('Contact Me', style: context.textTheme.krButton1.copyWith(color: white)))),
      ],
    );
  }
}