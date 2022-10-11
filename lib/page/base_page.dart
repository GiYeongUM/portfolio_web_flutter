import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/before/theme_data.dart';
import 'package:giyeong_um_porfolio_page/controller/main_controller.dart';
import 'package:giyeong_um_porfolio_page/controller/responsive_controller.dart';

class BasePage extends StatelessWidget {
  BasePage({Key? key, required this.child}) : super(key: key);

  final Widget child;
  final _responsiveController = Get.find<ResponsiveController>();
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  () async {
        return false;
      },
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < _responsiveController.mobileWidth && !kIsWeb) {
          _responsiveController.changePlatform(Platform.mobile);
          /// 스마트폰 앱
        } else if (constraints.maxWidth < _responsiveController.mobileWidth &&
            kIsWeb) {
          _responsiveController.changePlatform(Platform.desktopMobile);
          /// 스마트폰 웹
        } else if (constraints.maxWidth < _responsiveController.desktopWidth &&
            !kIsWeb) {
          _responsiveController.changePlatform(Platform.tablet);
          /// 태블릿 앱
        } else {
          _responsiveController.changePlatform(Platform.desktop);
          /// 웹, 태블릿 웹
        }
        return Scaffold(
          body: Obx(
            () => Row(
              children: <Widget>[
                if (_responsiveController.platform.value == Platform.desktop)
                  MouseRegion(
                    onEnter: (event){
                      _responsiveController.animation.value = true;
                    },
                    onExit: (event){
                      _responsiveController.animation.value = false;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: _responsiveController.animation.value ? 200 : 70,
                      child: NavigationRail(
                        selectedIndex: _mainController.selectedIndex.value,
                        onDestinationSelected: (int index) {
                          _mainController.pageChanged(index);
                        },
                        labelType: NavigationRailLabelType.selected,
                        destinations: _mainController.buildNavigationRailItems(),
                      ),
                    ),
                  ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: child,
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
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    enableFeedback: true,
                    currentIndex: _mainController.selectedIndex.value,
                    onTap: (int index) {
                      _mainController.pageChanged(index);
                    },
                    items: _mainController.buildBottomNavBarItems()),
          ),
        );
      }),
    );
  }
}
