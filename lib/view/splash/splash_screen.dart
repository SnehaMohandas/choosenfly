import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/login/login_screen.dart';
import 'package:choose_n_fly/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        var sConroller = Get.put(SplashController());
        return Scaffold(
          backgroundColor: Colors.white, // Set your desired background color
          body: Center(
            child:
                FadeInSplashContent(), // Use your animated splash content widget
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }
}
// class SplashScreen extends StatelessWidget {
//   SplashScreen({super.key});

//   final NetworkController networkController = Get.put(NetworkController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (networkController.isConnected.value) {
//         SplashController splashController = Get.put(SplashController());
//         return Scaffold(
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Container(
//                   // height: 200,
//                   height: 120,
//                   width: 120,

//                   // width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage("assets/images/logo.png"))),
//                 ),
//               )
//             ],
//           ),
//         );
//       } else {
//         return networkController.noDataImage(context);
//       }
//     });
//   }
// }

class FadeInSplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 6),
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
