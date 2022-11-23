import 'package:astha_trade_app/ui/first_screen.dart';
import 'package:astha_trade_app/getx/home_getx.dart';
import 'package:astha_trade_app/ui/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  final controller= Get.put(HomeGetX());



  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: controller,builder: (controller) {
      return PageView(
          controller: controller.pageController,
          children: const [FirstScreen(), SecondScreen()],
        );
    },);
  }
}
