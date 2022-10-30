import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giyeong_um_porfolio_page/view/base_page.dart';

import '../controller/career_page_controller.dart';


class CareerPage extends StatelessWidget {
  CareerPage({Key? key}) : super(key: key);

  final careerPageController = Get.put(CareerPageController());

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
