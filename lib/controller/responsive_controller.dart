import 'package:get/get.dart';

enum Platform {
  mobile,
  desktop,
  desktopMobile,
  tablet,
}

class ResponsiveController extends GetxController {
  final mobileWidth = 700;
  final desktopWidth = 1440;
  var platform = Platform.mobile.obs;
  var animation = false.obs;
  
  Future<void> changePlatform(Platform platform) async{
    this.platform.value = platform;
  }
}