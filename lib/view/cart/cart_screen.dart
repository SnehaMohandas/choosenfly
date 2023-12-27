import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/booking_d_inner.dart';
import 'package:choose_n_fly/view/cart/cart_detail.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../booking_details/req_confirmation.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final NetworkController networkController = Get.find<NetworkController>();

  List images = [
    "https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg",
    "https://www.ahstatic.com/photos/c096_ho_00_p_1024x768.jpg",
    "https://m.economictimes.com/thumb/msid-73023854,width-1200,height-900,resizemode-4,imgsize-235513/hotel-agencies.jpg",
    "https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aG90ZWxzfGVufDB8fDB8fHww"
  ];
  List names = [
    "Jumerah Creekside Hotel",
    "Six Senses Zighy Bay",
    "Grand Hyatt Dubai",
    "JW Mariott Marquis Hotel"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 82,
                leading: IconButton(
                    onPressed: () {
                      // Get.offAll(() => HomeScreen());
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorConstant.white,
                    )),
                title: Text(
                  'Your Cart',
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                flexibleSpace: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)))),
              ),
              body: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              //height: MediaQuery.of(context).size.height * 0.15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: const Offset(0, 1),
                                        spreadRadius: 2,
                                        blurRadius: 10)
                                  ],
                                  color: ColorConstant.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => CartDetails(),
                                          transition:
                                              Transition.rightToLeftWithFade);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 12,
                                          bottom: 12),
                                      child: GestureDetector(
                                        // onTap: () {
                                        //   Get.to(() => CartDetails(),
                                        //       transition:
                                        //           Transition.rightToLeftWithFade);
                                        // },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: CachedNetworkImage(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.08,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.17,
                                                imageUrl: images[index],
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.08,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.17,
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.531),
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: Lottie.asset(
                                                      "assets/animation/Animation - 1700807305736.json",
                                                      fit: BoxFit.cover),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => CartDetails(),
                                          transition:
                                              Transition.rightToLeftWithFade);
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "Jumerah creekside hotel duabi united",
                                              names[index],
                                              maxLines: 1,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 7),
                                              child: Text(
                                                "Dubai-United Arab Emirates",
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .lightBlue2,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Text(
                                              "20-Nov-2023",
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.lightBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      removeDialogue(context);
                                    },
                                    child: Container(
                                        // color: Colors.amber,
                                        margin:
                                            EdgeInsets.only(top: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.cancel_outlined,
                                                size: 20,
                                                color: ColorConstant.red),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ));
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }
}

removeDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text('Remove?', style: TextStyle(fontSize: 17)),
          content: const Text('Are you sure want to Remove?',
              style: TextStyle(fontSize: 14)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 219, 61, 61))),
                onPressed: () {
                  Fluttertoast.showToast(msg: "Removed from cart");
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(color: ColorConstant.white),
                ))
          ],
        ),
      );
    },
  );
}
