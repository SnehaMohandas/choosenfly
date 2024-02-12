import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartDetails extends StatelessWidget {
  CartDetails({super.key});
  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        return Scaffold(
          bottomSheet: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => PaymentPage(hotelNmae: ,),
                //     transition: Transition.rightToLeftWithFade);
              },
              child: const CustomButton(
                child: Center(
                    child: Text(
                  "Book Now",
                  style: TextStyle(
                      color: ColorConstant.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      color: ColorConstant.white,
                    ),
                    CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      imageUrl:
                          "https://images.alphacoders.com/108/thumb-1920-1087214.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorConstant.grey,
                          borderRadius: BorderRadius.circular(8.531),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: Lottie.asset(
                            "assets/animation/Animation - 1700807305736.json",
                            fit: BoxFit.cover),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(88, 0, 0, 0),
                        Color.fromARGB(52, 80, 79, 79)
                      ])
                          // color: Colors.amber,
                          ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 65, left: 18),
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: ColorConstant.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.17),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Jumerah Creekside hotel",
                                  style: TextStyle(
                                      color: ColorConstant.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Dubai, UAE",
                                  style: TextStyle(
                                      color: ColorConstant.white, fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: MediaQuery.of(context).size.height * 0.4,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorConstant.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 20, right: 20, bottom: 60),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(8),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              offset: const Offset(0, 1),
                                              spreadRadius: 2,
                                              blurRadius: 10)
                                        ],
                                        color: ColorConstant.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Check-In",
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .lightBlue2,
                                                    fontSize: 12),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_month,
                                                    color: ColorConstant
                                                        .primaryColor,
                                                  ),
                                                  Text(" 20-Nov-2023")
                                                ],
                                              )
                                            ],
                                          ),
                                          VerticalDivider(
                                              thickness: 0.6,
                                              color: ColorConstant.grey),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "   Check-Out",
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .lightBlue2,
                                                    fontSize: 12),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_month,
                                                    color: ColorConstant
                                                        .primaryColor,
                                                  ),
                                                  Text(" 25-Nov-2023")
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6, bottom: 20, left: 6, right: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      const Text(
                                        "Guests",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: ColorConstant.grey,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.group_outlined,
                                            color: ColorConstant.primaryColor,
                                          ),
                                          Text("  3 Adults, 2 Children"),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      const Text(
                                        "Deadline Date",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: ColorConstant.grey,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.date_range_rounded,
                                            color: ColorConstant.primaryColor,
                                          ),
                                          Text("  12-Dec-2023"),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      const Text(
                                        "Payment Details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: ColorConstant.grey,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Subtotal",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            "149 AED",
                                            style: TextStyle(
                                              color: ColorConstant.black,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("GST(10 %)",
                                              style: TextStyle(fontSize: 10)),
                                          Text("10 AED",
                                              style: TextStyle(
                                                  color: ColorConstant.black,
                                                  fontSize: 11))
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text("159 AED",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      ),
                                      const Text(
                                        "Customer Details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: ColorConstant.grey,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                          Text(
                                            "Zhang Liou",
                                            style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "conatct No",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                          Text(
                                            "9876543210",
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "E-mail",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                          Text(
                                            "Zl@gmail.com",
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Passport No",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                          Text(
                                            "FEW2345HYUU",
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "LPO",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                          Text(
                                            "435353",
                                            style: TextStyle(fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }
}
