
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeGetX extends GetxController{
  final PageController pageController = PageController();
  final TextEditingController textEditingController= TextEditingController();
  late final WebViewController webViewController;
  int selectedIndex = 0;
  int loadingPercentage=0;

  onItemTapped(int index) {

    pageController.jumpToPage(index);
    selectedIndex = index;
    update();

  }

  setLoadingPercentage(value){
    loadingPercentage=value;
    update();
  }

  setPageUrl(value){
    textEditingController.text=value;
    update();
  }

  setWebViewController(value){
    webViewController=value;
    update();
  }

}