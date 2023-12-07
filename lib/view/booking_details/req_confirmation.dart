import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/booking_vocher.dart';
import 'package:choose_n_fly/view/booking_details/controller/req_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReqConfirmScreen extends StatelessWidget {
  ReqConfirmScreen({super.key});
  var reqController = Get.put(ReqConfirmController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 82,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Request Confirmation Voucher',
          style: TextStyle(
              color: ColorConstant.white,
              fontSize: MediaQuery.of(context).size.height * 0.023),
        ),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: ColorConstant.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildRadioButton('Request'),
                _buildRadioButton('Confirmation'),
                _buildRadioButton('Voucher')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            //height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: ColorConstant.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 212, 233, 239),

                      // color: Color.fromARGB(255, 228, 237, 242),

                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6))),
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Spacer(),
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Jumerah Creekside Hotel",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: ColorConstant.lightBlue,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017)),
                            ),
                          ),
                        ),
                        //Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BookingVoucher(),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 8),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.lightBlue,
                              ),
                              child: Icon(
                                Icons.send,
                                color: ColorConstant.white,
                                size: 20,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Confirmation Reference :  ',
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  color: ColorConstant.lightBlue2,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015),
                            ),
                            TextSpan(
                              text: 'CNFS3444443322264664',
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  color: ColorConstant.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Supplier Reference               :  ',
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  color: ColorConstant.lightBlue2,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015),
                            ),
                            TextSpan(
                              text: '243',
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  color: ColorConstant.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003,
                      ),
                      Row(
                        children: [
                          Text("Confirmation Status             : ",
                              style: TextStyle(
                                  color: ColorConstant.lightBlue2,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015)),
                          Text(
                            "Confirmed",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 237, 237, 238),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: 47,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Check-In",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.015)),
                                Text(
                                  "20/11/2023",
                                  style: TextStyle(
                                      color: ColorConstant.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                )
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 237, 237, 238),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            height: 47,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Check-Out",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.015)),
                                Text(
                                  "30/11/2023",
                                  style: TextStyle(
                                      color: ColorConstant.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         // color: ColorConstant.lightBlue,
                      //         border: Border.all(color: Colors.green),
                      //         borderRadius: BorderRadius.circular(6),
                      //       ),
                      //       height: 35,
                      //       width: MediaQuery.of(context).size.width * 0.27,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "Confirmed",
                      //             style: TextStyle(
                      //                 color: Colors.green,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize:
                      //                     MediaQuery.of(context).size.height *
                      //                         0.016),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 9,
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRadioButton(String value) {
    return Obx(
      () => Container(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: reqController.selectedValue.value,
              onChanged: (selected) => reqController.setSelectedValue(value),
            ),
            Text(value,
                style: TextStyle(color: ColorConstant.black, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedValue() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Selected Value: ${reqController.selectedValue}',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
