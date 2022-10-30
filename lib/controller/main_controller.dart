import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/controller/responsive_controller.dart';
import 'package:giyeong_um_porfolio_page/view/career_page.dart';
import 'package:giyeong_um_porfolio_page/view/dev_page.dart';
import 'package:giyeong_um_porfolio_page/view/home_page.dart';
import 'package:giyeong_um_porfolio_page/view/project_page.dart';


class MainController extends GetxController {
  var selectedIndex = 0.obs;
  var indexList = [0].obs;
  var pageController = PageController();
  final _responsiveController = Get.find<ResponsiveController>();

  pageChanged(int index) async {
    selectedIndex.value = index;
    indexList.add(index);

    switch(index){
      case 0:
        await Get.to(() => HomePage(), transition: Transition.fadeIn);
        break;
      case 1:
        await Get.to(() => CareerPage(), transition: Transition.fadeIn);
        break;
      case 2:
        await Get.to(() => ProjectPage(), transition: Transition.fadeIn);
        break;
      case 3:
        await Get.to(() => DevPage(), transition: Transition.fadeIn);
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
    return [
      const NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Home', style: TextStyle(fontSize: 10),),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.business),
        selectedIcon: Icon(Icons.business_outlined),
        label: Text('Career', style: TextStyle(fontSize: 10),),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.memory),
        selectedIcon: Icon(Icons.memory_outlined),
        label: Text('Project', style: TextStyle(fontSize: 10),),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.computer),
        selectedIcon: Icon(Icons.computer),
        label: Text('Dev', style: TextStyle(fontSize: 10),),
      ),
    ];
  }

}