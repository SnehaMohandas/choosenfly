import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/login/login_screen.dart';
import 'package:choose_n_fly/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sConroller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: FadeInSplashContent(), // Use your animated splash content widget
      ),
    );
  }
}

class FadeInSplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 4),
        onEnd: () {
          // Get.offAll(SignInPage());
        },
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 3),
            onEnd: () {
              //Get.offAll(SignInPage());
            },
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child:
                //   child:
                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png', // Replace with your image asset path
                  width: MediaQuery.of(context).size.height * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
              ],
            )));
  }
}
