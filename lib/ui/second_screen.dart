import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../getx/home_getx.dart';
import 'navigation_controls.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with AutomaticKeepAliveClientMixin {
  static final List<Color> gradiantColors = [
    HexColor("F0F1F3"),
    HexColor("F0F1F3"),
    HexColor("D7DAEB"),
  ];
  static final Color greyColor = HexColor("616161");
  final controller = Get.put(HomeGetX());
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return WillPopScope(
          child: Scaffold(
              appBar: AppBar(title:  Container(
              height:  58,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: greyColor.withOpacity(0.4)),
              gradient: LinearGradient(colors: gradiantColors),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: TextField(
                controller: controller.textEditingController,
                decoration: InputDecoration(
                hintText: '',
                border: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                  const BorderSide(style: BorderStyle.none, width: 0),
                ),
              ),))),actions: [
                NavigationControls()
              ],
                backgroundColor: Colors.grey[100],
                leading: IconButton(
                  iconSize: 25,
                  icon: const Icon(
                    Icons.arrow_back,color: Colors.black54,
                  ),
                  onPressed: () {
                    controller.onItemTapped(0);
                  },

                ),
              ),
              body: Stack(
                children: [
                  WebView(
                    onWebViewCreated: (webViewController) {
                      controller.setWebViewController(webViewController);
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: 'https://asthatrade.com/product/flow',
                    onPageStarted: (url) {
                      controller.setLoadingPercentage(0);
                      controller.setPageUrl(url);
                    },
                    onProgress: (progress) {
                      controller.setLoadingPercentage(progress);
                    },
                    onPageFinished: (url) {
                      controller.setLoadingPercentage(100);
                    },
                  ), if (controller.loadingPercentage < 100)
                    LinearProgressIndicator(
                      value: controller.loadingPercentage / 100.0,
                    ),
                ],
              )),
          onWillPop: () async {
            controller.onItemTapped(0);
            return false;
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
