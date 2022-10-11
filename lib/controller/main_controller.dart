import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/controller/responsive_controller.dart';
import 'package:giyeong_um_porfolio_page/page/career_page.dart';
import 'package:giyeong_um_porfolio_page/page/dev_page.dart';
import 'package:giyeong_um_porfolio_page/page/home_page.dart';
import 'package:giyeong_um_porfolio_page/page/project_page.dart';


class MainController extends GetxController {
  var selectedIndex = 0.obs;
  var pageController = PageController();
  final _responsiveController = Get.find<ResponsiveController>();

  pageChanged(int index) {
    selectedIndex.value = index;
    _responsiveController.animation.value = false;
    switch(index){
      case 0:
        Get.to(() => HomePage(), transition: Transition.noTransition);
        break;
      case 1:
        Get.to(() => CareerPage(), transition: Transition.noTransition);
        break;
      case 2:
        Get.to(() => ProjectPage(), transition: Transition.noTransition);
        break;
      case 3:
        Get.to(() => DevPage(), transition: Transition.noTransition);
        break;
    }

  }


  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: selectedIndex.value == 0
            ? const Icon(Icons.home)
            : const Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: selectedIndex.value == 1
            ? const Icon(Icons.business)
            : const Icon(Icons.business),
        label: 'Career',
      ),
      BottomNavigationBarItem(
        icon: selectedIndex.value == 2
            ? const Icon(Icons.memory)
            : const Icon(Icons.memory_outlined),
        label: 'Project',
      ),
      BottomNavigationBarItem(
        icon: selectedIndex.value == 3
            ? const Icon(Icons.computer)
            : const Icon(Icons.computer),
        label: 'Dev',
      ),
    ];
  }

  List<NavigationRailDestination> buildNavigationRailItems() {
    return const [
      NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.business),
        selectedIcon: Icon(Icons.business_outlined),
        label: Text('Career'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.memory),
        selectedIcon: Icon(Icons.memory_outlined),
        label: Text('Project'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.computer),
        selectedIcon: Icon(Icons.computer),
        label: Text('Dev'),
      ),
    ];
  }

}