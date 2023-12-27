import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/payment/controller/pay_controller.dart';
import 'package:choose_n_fly/view/payment/payment_done.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<PayController>();
        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          var payController = Get.put(PayController());

          return Scaffold(
            bottomSheet: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 20, top: 10),
              child: GestureDetector(
                onTap: () {
                  if (payController.selectedValue.value ==
                      "Credit or Debit Card") {
                    if (485 <= 1000) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              title: const Text('Payment',
                                  style: TextStyle(fontSize: 17)),
                              content: const Text(
                                  'You have enough amount in your wallet for making this payment',
                                  style: TextStyle(
                                      fontSize: 13.5, color: Colors.black54)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      print("amazon payment gateway");
                    }
                  } else if (payController.selectedValue.value == "Wallet") {
                    if (4850 < 1000) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              title: const Text('Insufficient Balance',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black)),
                              content: const Text(
                                  'Insufficient balance in your wallet. Please make card payment',
                                  style: TextStyle(
                                      fontSize: 13.5, color: Colors.black54)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            child: AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              title: const Text('Wallet Payment',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black)),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                      'Are you sure want to confirm payment?',
                                      style: TextStyle(
                                          fontSize: 13.5,
                                          color: Colors.black54)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Container(
                                    child: const Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Wallet Total",
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "10000",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Payment amount",
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              "1000",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Balance",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: ColorConstant.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "9000",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('cancel'),
                                ),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                ColorConstant.lightBlue)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Get.offAll(
                                          () => const PaymentDoneScreen(),
                                          transition:
                                              Transition.rightToLeftWithFade);
                                      // Fluttertoast.showToast(
                                      //     msg: "Payment done successfully");
                                      // Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Confirm",
                                      style:
                                          TextStyle(color: ColorConstant.white),
                                    ))
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }
                },
                child: const CustomButton(
                    child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: ColorConstant.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    await Get.delete<PayController>();

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.white,
                  )),
              title: const Text(
                'Payment',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)))),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hotel Name    -      ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Jumerah Creekside Hotel, Dubai",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Room Type      -      ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "Deluxe Room",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Date                        -      ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "20/12/2023 - 25/12/2023",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Guests                 -      ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "3 Adults, 2 Children",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal  ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "475 AED",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "GST  ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "10 AED",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.014,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total  ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "485 AED",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Text(
                        "Customer Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name                     -     ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Sneha Mohan",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "E-mail                    -     ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "sneha@gmail.com",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Contact No      -     ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "9876543210",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Passport No    -     ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "AS677YUURE",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "LPO                          -     ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "UYT3",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              // Text("Name"),
                              // Text("Name"),
                              // Text("Name")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Text(
                        "Select Payment Method",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              _buildRadioButton(
                                  'Wallet',
                                  const Color.fromARGB(255, 111, 221, 166),
                                  const Icon(
                                    Icons.wallet_outlined,
                                    color: ColorConstant.white,
                                    size: 20,
                                  ),
                                  context,
                                  payController),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.013,
                              ),
                              _buildRadioButton(
                                  'Credit or Debit Card',
                                  const Color.fromARGB(255, 240, 185, 123),
                                  const Icon(
                                    Icons.credit_card,
                                    color: ColorConstant.white,
                                    size: 20,
                                  ),
                                  context,
                                  payController),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }

  Widget _buildRadioButton(String value, color, icon, BuildContext context,
      PayController payController) {
    return Obx(
      () => Container(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                child: icon,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(0, 1))
                    ]),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(value,
                  style: TextStyle(
                      color: ColorConstant.black,
                      fontSize: MediaQuery.of(context).size.height * 0.018)),
              const Spacer(),
              Radio(
                value: value,
                groupValue: payController.selectedValue.value,
                onChanged: (selected) {
                  payController.setSelectedValue(value);
                  print(payController.selectedValue.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
