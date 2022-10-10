import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';
import 'package:giyeong_um_porfolio_page/controller/responsive_controller.dart';
import 'package:giyeong_um_porfolio_page/page/career_page.dart';
import 'package:giyeong_um_porfolio_page/page/dev_page.dart';
import 'package:giyeong_um_porfolio_page/page/home_page.dart';
import 'package:giyeong_um_porfolio_page/page/project_page.dart';

class CareerPage extends StatelessWidget {
  CareerPage({Key? key}) : super(key: key);

  final _mainController = Get.find<MainController>();
  final _responsiveController = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => Row(
          children: <Widget>[
            if (_responsiveController.platform.value == Platform.desktop)
              NavigationRail(
                selectedIndex: _mainController.selectedIndex.value,
                onDestinationSelected: (int index) {
                  _mainController.pageChanged(index);
                },
                labelType: NavigationRailLabelType.selected,
                destinations: _mainController.buildNavigationRailItems(),
              ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: DevPage(),
              //   PageView(
              //     controller: _mainController.pageController,
              //     children: <Widget>[
              //       HomePage(),
              //       CareerPage(),
              //       ProjectPage(),
              //       DevPage()
              //     ],
              //   // Center(
              //   //   child: Obx(() => GridView.builder(
              //   //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   //           crossAxisCount: _responsiveController.platform.value == Platform.desktopMobile ? 1 : 2,
              //   //           childAspectRatio: 1,
              //   //           mainAxisSpacing: 10,
              //   //           crossAxisSpacing: 10,
              //   //         ),
              //   //         itemCount: 10,
              //   //         itemBuilder: (BuildContext ctx, int idx) {
              //   //           return Container(
              //   //             color:
              //   //                 Color((idx * 0xFFFFFF).toInt()).withOpacity(1.0),
              //   //           );
              //   //         },
              //   //       )),
              //   // ),
              // ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
            () => _responsiveController.platform.value == Platform.desktop
            ? const SizedBox(
          width: 0,
          height: 0,
        )
            : BottomNavigationBar(
            currentIndex: _mainController.selectedIndex.value,
            onTap: (int index) {
              _mainController.pageChanged(index);
            },
            items: _mainController.buildBottomNavBarItems()),
      ),
    );
  }
}
