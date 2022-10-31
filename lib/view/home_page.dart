import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'base_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: SingleChildScrollView(
        controller: homeController.homeScrollController,
        child: Column(
          children: [
            Container(
              width: 1920.sp,
              height: MediaQuery.of(context).size.height,
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff131e13),
                    const Color(0xff131f13).withOpacity(0.92),
                    const Color(0xff131f13).withOpacity(0.73)
                  ],
                ),
              ),
            ),
            Container(
              width: 1920.sp,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
