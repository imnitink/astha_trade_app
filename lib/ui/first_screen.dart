import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/home_getx.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(HomeGetX());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("Web View App")),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.onItemTapped(1);
                    },
                    child: const Text("Button"))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
