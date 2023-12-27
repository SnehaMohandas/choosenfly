import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentDoneScreen extends StatelessWidget {
  const PaymentDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Center(
              child: Container(
                // height: 280,
                // width: 280,
                child: Lottie.asset(
                    "assets/animation/Animation - 1702294122557.json",
                    repeat: false),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorConstant.primaryColor)),
                onPressed: () async {
                  await Get.delete<AccomodationController>();
                  await Get.delete<RoomController2>();

                  Get.offAll(() => HomeScreen());
                },
                child: const Text(
                  "Done",
                  style: TextStyle(color: ColorConstant.white),
                ))
          ],
        ),
      ),
    );
  }
}
