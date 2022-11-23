// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class BasePage extends StatelessWidget {
//   BasePage({Key? key, required this.child}) : super(key: key);
//
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop:  () async {
//         // _mainController.indexList.removeLast();
//         // _mainController.selectedIndex.value = _mainController.indexList.last ?? 0;
//         return true;
//       },
//       child: LayoutBuilder(builder: (context, constraints) {
//         if (constraints.maxWidth < _responsiveController.mobileWidth && !kIsWeb) {
//           _responsiveController.changePlatform(Platform.mobile);
//           /// 스마트폰 앱
//         } else if (constraints.maxWidth < _responsiveController.mobileWidth &&
//             kIsWeb) {
//           _responsiveController.changePlatform(Platform.desktopMobile);
//           /// 스마트폰 웹
//         } else if (constraints.maxWidth < _responsiveController.desktopWidth &&
//             !kIsWeb) {
//           _responsiveController.changePlatform(Platform.tablet);
//           /// 태블릿 앱
//         } else {
//           _responsiveController.changePlatform(Platform.desktop);
//           /// 웹, 태블릿 웹
//         }
//         return Scaffold(
//           body: Obx(
//             () => Row(
//               children: <Widget>[
//                 if (_responsiveController.platform.value == Platform.desktop)
//                   MouseRegion(
//                     onEnter: (event){
//                       _responsiveController.animation.value = true;
//                     },
//                     onExit: (event){
//                       if(!_responsiveController.paging.value) _responsiveController.animation.value = false;
//                     },
//                     child: AnimatedContainer(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(color: Colors.black.withOpacity(0.25), offset: Offset(5, 4), blurRadius: 4)
//                         ]
//                       ),
//                       duration: const Duration(milliseconds: 500),
//                       curve: Curves.easeInOut,
//                       width: _responsiveController.animation.value ? 200 : 72,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         physics: const NeverScrollableScrollPhysics(),
//                         child: NavigationRail(
//                           extended: true,
//                           selectedIndex: _mainController.selectedIndex.value,
//                           onDestinationSelected: (int index) async {
//                             _responsiveController.paging.value = true;
//                             _responsiveController.animation.value = true;
//                             Future.delayed(const Duration(milliseconds: 50), (){
//                               _responsiveController.paging.value = false;
//                             });
//                             await _mainController.pageChanged(index);
//
//
//                           },
//                           backgroundColor: Color(0xff1D221F),
//                           destinations: _mainController.buildNavigationRailItems(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 Expanded(
//                   child: child,
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: Obx(
//             () => _responsiveController.platform.value == Platform.desktop
//                 ? const SizedBox(
//                     width: 0,
//                     height: 0,
//                   )
//                 : BottomNavigationBar(
//                     showSelectedLabels: true,
//                     showUnselectedLabels: false,
//                     enableFeedback: true,
//                     currentIndex: _mainController.selectedIndex.value,
//                     onTap: (int index) {
//                       _mainController.pageChanged(index);
//                     },
//                     items: _mainController.buildBottomNavBarItems()),
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(child: child,);
  }
}
