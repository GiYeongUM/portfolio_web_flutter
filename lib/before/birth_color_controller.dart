import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BirthColorController extends GetxController {
  var birth = DateTime.now().obs;
  var color = const Color(0xFFFF0000).obs;
}