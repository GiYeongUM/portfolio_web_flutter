
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/page/main_page.dart';

class SplashController extends GetxController {

  var opacity = 0.0.obs;
  var marginRight = 150.0.obs;
  var splashEnd = false.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      marginRight.value = 0.0;
      opacity.value = 1.0;
      Future.delayed(const Duration(milliseconds: 1500), (){
        splashEnd.value = true;
      });
    });
    super.onInit();
  }

}