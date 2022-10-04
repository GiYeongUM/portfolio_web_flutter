import 'package:get/get.dart';

enum Platform {
  mobile,
  desktop,
  desktopMobile,
  tablet,
}

class ResponsiveController extends GetxController {
  final mobileWidth = 600;
  final desktopWidth = 1440;
  var platform = Platform.mobile.obs;
}