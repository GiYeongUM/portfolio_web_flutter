import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/page/career_page.dart';
import 'package:giyeong_um_porfolio_page/page/main_page.dart';


class MainController extends GetxController {
  var selectedIndex = 0.obs;
  var pageController = PageController();
  List<String> pageList = ['/mainpage', '/careerpage'];

  pageChanged(int index) {
    // pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    print(pageList[index]);
    selectedIndex.value = index;
    switch(index){
      case 0:
        Get.to(() => MainPage(), transition: Transition.noTransition);
        break;
      case 1:
        Get.to(() => CareerPage(), transition: Transition.noTransition);
    }

  }


  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: selectedIndex.value == 0
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        label: 'First',
      ),
      BottomNavigationBarItem(
        icon: selectedIndex.value == 1
            ? const Icon(Icons.bookmark)
            : const Icon(Icons.bookmark_border),
        label: 'Second',
      ),
      BottomNavigationBarItem(
        icon: selectedIndex.value == 2
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
        label: 'Third',
      ),
    ];
  }

  List<NavigationRailDestination> buildNavigationRailItems() {
    return const [
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
    ];
  }

}