
import 'package:astha_trade_app/getx/home_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationControls extends StatelessWidget {
 const NavigationControls({super.key});



  @override
  Widget build(BuildContext context) {
    final controller= Get.put(HomeGetX());
    return GetBuilder(
      init: controller,
      builder: (controller) {


        return Container(
          width: MediaQuery.of(context).size.width*0.25,
          child: Row(
            children: <Widget>[
              IconButton(color:  Colors.black54,
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  if (await controller.webViewController.canGoBack()) {
                    await controller.webViewController.goBack();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No back history item')),
                    );
                    return;
                  }
                },
              ),
              IconButton(
                color:  Colors.black54,
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () async {
                  if (await controller.webViewController.canGoForward()) {
                    await controller.webViewController.goForward();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No forward history item')),
                    );
                    return;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}