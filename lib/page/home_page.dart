import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/controller/home_page_controller.dart';
import 'package:giyeong_um_porfolio_page/controller/responsive_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _homePageController = Get.put(HomePageController());
  final _responsiveController = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Obx(() => NavigationRail(
                selectedIndex: _homePageController.selectedIndex.value,
                onDestinationSelected: (int index) {
                  _homePageController.selectedIndex.value = index;
                },
                labelType: NavigationRailLabelType.selected,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('First'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark_border),
                    selectedIcon: Icon(Icons.book),
                    label: Text('Second'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star_border),
                    selectedIcon: Icon(Icons.star),
                    label: Text('Third'),
                  ),
                ],
              )),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Obx(
                () => Text("${_responsiveController.platform.value}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
