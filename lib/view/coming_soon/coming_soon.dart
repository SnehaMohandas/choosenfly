// ignore_for_file: prefer_const_constructors

import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ComingSoon extends StatelessWidget {
  ComingSoon({super.key});
  var homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        homeController.selecedTab.value = 0;

        //Get.offAll(() => HomeScreen());

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                homeController.selecedTab.value = 0;
                Get.back();

                //Get.offAll(() => HomeScreen());
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Container(
              height: 200,
              width: 200,
              child: Lottie.asset("assets/animation/coming_soon.json",
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
