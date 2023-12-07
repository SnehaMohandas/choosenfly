import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/booking_details/booking_d_inner.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_d_controller.dart';
import 'package:choose_n_fly/view/booking_details/req_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class BookingDetail extends StatelessWidget {
  BookingDetail({super.key});
  final BookingDController bookingdController = Get.put(BookingDController());

  List images = [
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/f5/5d/44/jumeirah-creekside-hotel.jpg?w=700&h=-1&s=1",
    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/232963819.jpg?k=444eace50a71e6717882b22b905ff5cd9d83f0ec76061f10c85fd2f9218e83fc&o=&hp=1",
    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/238688273.jpg?k=90f0d5fb9e24ee327b030fa80d2800174b23694e6188c5413a90c0f969c282a5&o=&hp=1",
    "https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?cs=srgb&dl=pexels-pixabay-258154.jpg&fm=jpg"
  ];
  List names = [
    "Jumerah Creekside Hotel",
    "Six Senses Zighy Bay",
    "Grand Hyatt Dubai",
    "JW Mariott Marquis Hotel"
  ];

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
          'All Bookings',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: DropdownButtonFormField(
                value: bookingdController.selectedStatus.value == ""
                    ? null
                    : bookingdController.selectedStatus.value,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 6, bottom: 6, left: 14, right: 14),
                    hintStyle: TextingStyle.font14normalLb,
                    hintText: 'Select Status',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConstant.grey),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConstant.grey),
                        borderRadius: BorderRadius.circular(10))),
                items: bookingdController.status.map((item) {
                  return DropdownMenuItem(
                      value: item[1],
                      child: Text(
                        item[0],
                        style: TextStyle(fontSize: 14),
                      ));
                }).toList(),
                onChanged: (v) {
                  bookingdController.selectedStatus.value = v.toString();

                  print(bookingdController.selectedStatus.value);
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select room";
                  }
                  return null;
                },
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildRadioButton('Upcoming', context),
            //     _buildRadioButton('Completed', context),
            //     _buildRadioButton('Cancelled', context)
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showMonthPicker(
                          context: context,
                          initialDate: DateTime.now(),
                        ).then((date) {
                          if (date != null) {
                            var selctddate = date;

                            bookingdController.timePeriod.value =
                                DateFormat('MMM/yyyy').format(selctddate);
                            print(bookingdController.timePeriod.value);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorConstant.grey)
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.2),
                            //     blurRadius: 4,
                            //     offset: const Offset(0, 1),
                            //   ),
                            // ],
                            ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ),
                            ),
                            //Spacer(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Center(
                                child: Obx(
                              () => bookingdController.timePeriod.value == ""
                                  ? const Text(
                                      " Dec/2023",
                                      style: TextStyle(fontSize: 13),
                                    )
                                  : Text(
                                      " ${bookingdController.timePeriod.value}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              suffixIcon: const Icon(
                                Icons.search,
                                size: 18,
                              ),
                              hintStyle: const TextStyle(fontSize: 13),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorConstant.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorConstant.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.all(10))),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => BookingInnerpage(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        //height: MediaQuery.of(context).size.height * 0.15,
                        width: double.infinity,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(0, 1))
                        ], color: ColorConstant.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: NetworkImage(images[index]),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 13),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    child: Text(
                                      "Dubai-United Arab Emirates",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        //color: Colors.amber,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.43,
                                        child: Text(
                                          "20-Nov-2023",
                                          style: TextStyle(
                                              color: ColorConstant.lightBlue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // height: 39,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                      Container(
                                        //color: Colors.amber,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showDialogue(context);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                size: 20,
                                                color: Colors.red[800],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() => ReqConfirmScreen(),
                                                    transition: Transition
                                                        .rightToLeftWithFade);
                                              },
                                              child: Icon(
                                                Icons.email,
                                                size: 20,
                                                color: ColorConstant.signBlue,
                                              ),
                                            )
                                          ],
                                        ),
                                        // height: 39,
                                      )
                                    ],
                                  )
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       "Nov-20-2023",
                                  //       style: TextStyle(
                                  //           color: ColorConstant.lightBlue,
                                  //           fontSize: 12,
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //     SizedBox(
                                  //       width:
                                  //           MediaQuery.of(context).size.width *
                                  //               0.22,
                                  //     ),
                                  //     Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.end,
                                  //       children: [
                                  //         Icon(
                                  //           Icons.delete,
                                  //           size: 23,
                                  //           color: ColorConstant.red,
                                  //         ),
                                  //         SizedBox(
                                  //           width: 5,
                                  //         ),
                                  //         Icon(
                                  //           Icons.email,
                                  //           size: 23,
                                  //           color: ColorConstant.lightBlue,
                                  //         ),
                                  //       ],
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //==================
                      // child: Container(
                      //   margin: const EdgeInsets.symmetric(
                      //       vertical: 10, horizontal: 12),
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(6),
                      //     color: Colors.white,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black.withOpacity(0.3),
                      //         spreadRadius: 1,
                      //         blurRadius: 2,
                      //         offset: const Offset(0, 1),
                      //       ),
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       GestureDetector(
                      //         onTap: () {},
                      //         child: Container(
                      //           height: 60,
                      //           decoration: const BoxDecoration(
                      //               color: Color.fromARGB(255, 212, 233, 239),
                      //               borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(6),
                      //                   topRight: Radius.circular(6))),
                      //           width: double.infinity,
                      //           child: Center(
                      //             child: Text(
                      //                 "Jumerah Creekside Hotel\n(13/11/2023-20/11/2023)",
                      //                 style: TextStyle(
                      //                     color: ColorConstant.lightBlue,
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: MediaQuery.of(context)
                      //                             .size
                      //                             .height *
                      //                         0.015)),
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 20, vertical: 10),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             GestureDetector(
                      //               onTap: () {
                      //                 Get.to(() => BookingInnerpage());
                      //               },
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       Row(
                      //                         children: [
                      //                           Text(
                      //                             'Agent name              :  ',
                      //                             style: TextStyle(
                      //                                 color: ColorConstant
                      //                                     .lightBlue2,
                      //                                 fontSize:
                      //                                     MediaQuery.of(context)
                      //                                             .size
                      //                                             .height *
                      //                                         0.015),
                      //                           ),
                      //                           SizedBox(
                      //                             width: MediaQuery.of(context)
                      //                                     .size
                      //                                     .width *
                      //                                 0.43,
                      //                             child: Text('Direct Client',
                      //                                 maxLines: 2,
                      //                                 overflow:
                      //                                     TextOverflow.ellipsis,
                      //                                 style: TextStyle(
                      //                                     color: ColorConstant
                      //                                         .black,
                      //                                     fontSize: MediaQuery.of(
                      //                                                 context)
                      //                                             .size
                      //                                             .height *
                      //                                         0.015)),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       const Icon(
                      //                         Icons.check_box,
                      //                         color: Colors.green,
                      //                         size: 20,
                      //                       )
                      //                     ],
                      //                   ),
                      //                   //Customer name   :
                      //                   Row(
                      //                     children: [
                      //                       Text(
                      //                         'Customer name   :  ',
                      //                         style: TextStyle(
                      //                             color:
                      //                                 ColorConstant.lightBlue2,
                      //                             fontSize:
                      //                                 MediaQuery.of(context)
                      //                                         .size
                      //                                         .height *
                      //                                     0.015),
                      //                       ),
                      //                       SizedBox(
                      //                         width: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             0.43,
                      //                         child: Text('Ali Homoud',
                      //                             maxLines: 2,
                      //                             overflow:
                      //                                 TextOverflow.ellipsis,
                      //                             style: TextStyle(
                      //                                 color:
                      //                                     ColorConstant.black,
                      //                                 fontSize:
                      //                                     MediaQuery.of(context)
                      //                                             .size
                      //                                             .height *
                      //                                         0.015)),
                      //                       ),
                      //                     ],
                      //                   ),

                      //                   //  divider

                      //                   SizedBox(
                      //                     height: MediaQuery.of(context)
                      //                             .size
                      //                             .height *
                      //                         0.001,
                      //                   ),
                      //                   RichText(
                      //                     text: TextSpan(
                      //                       children: [
                      //                         TextSpan(
                      //                           text: 'Booking Code       :  ',
                      //                           style: TextStyle(
                      //                               fontFamily:
                      //                                   "Plus Jakarta Sans",
                      //                               color: ColorConstant
                      //                                   .lightBlue2,
                      //                               fontSize:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .height *
                      //                                       0.015),
                      //                         ),
                      //                         TextSpan(
                      //                           text: 'ACNFC_BOOK 0228',
                      //                           style: TextStyle(
                      //                               fontFamily:
                      //                                   "Plus Jakarta Sans",
                      //                               color: ColorConstant.black,
                      //                               fontSize:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .height *
                      //                                       0.015),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     height: MediaQuery.of(context)
                      //                             .size
                      //                             .height *
                      //                         0.001,
                      //                   ),
                      //                   RichText(
                      //                     text: TextSpan(
                      //                       children: [
                      //                         TextSpan(
                      //                           text: 'Reference Code  :  ',
                      //                           style: TextStyle(
                      //                               fontFamily:
                      //                                   "Plus Jakarta Sans",
                      //                               color: ColorConstant
                      //                                   .lightBlue2,
                      //                               fontSize:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .height *
                      //                                       0.015),
                      //                         ),
                      //                         TextSpan(
                      //                           text: '5244333556',
                      //                           style: TextStyle(
                      //                               fontFamily:
                      //                                   "Plus Jakarta Sans",
                      //                               color: ColorConstant.black,
                      //                               fontSize:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .height *
                      //                                       0.015),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),

                      //                   const SizedBox(
                      //                     height: 10,
                      //                   ),

                      //                   Row(
                      //                     children: [
                      //                       Expanded(
                      //                           child: Container(
                      //                         decoration: BoxDecoration(
                      //                           color: const Color.fromARGB(
                      //                               255, 237, 237, 238),
                      //                           borderRadius:
                      //                               BorderRadius.circular(6),
                      //                         ),
                      //                         height: 50,
                      //                         child: Column(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             Text("Booking Date",
                      //                                 style: TextStyle(
                      //                                     color: ColorConstant
                      //                                         .lightBlue2,
                      //                                     fontSize: MediaQuery.of(
                      //                                                 context)
                      //                                             .size
                      //                                             .height *
                      //                                         0.015)),
                      //                             Text(
                      //                               "20/11/2023",
                      //                               style: TextStyle(
                      //                                   fontSize: MediaQuery.of(
                      //                                               context)
                      //                                           .size
                      //                                           .height *
                      //                                       0.015),
                      //                             )
                      //                           ],
                      //                         ),
                      //                       )),
                      //                       const SizedBox(
                      //                         width: 15,
                      //                       ),
                      //                       Expanded(
                      //                           child: Container(
                      //                         decoration: BoxDecoration(
                      //                           color: const Color.fromARGB(
                      //                               255, 237, 237, 238),
                      //                           borderRadius:
                      //                               BorderRadius.circular(6),
                      //                         ),
                      //                         height: 50,
                      //                         child: Column(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             Text("Deadline Date",
                      //                                 style: TextStyle(
                      //                                     color: ColorConstant
                      //                                         .lightBlue2,
                      //                                     fontSize: MediaQuery.of(
                      //                                                 context)
                      //                                             .size
                      //                                             .height *
                      //                                         0.015)),
                      //                             Text(
                      //                               "30/11/2023",
                      //                               style: TextStyle(
                      //                                   fontSize: MediaQuery.of(
                      //                                               context)
                      //                                           .size
                      //                                           .height *
                      //                                       0.015),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       )),
                      //                     ],
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 10,
                      //                   ),
                      //                   Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.end,
                      //                     children: [
                      //                       Row(
                      //                         children: [
                      //                           GestureDetector(
                      //                             onTap: () {
                      //                               showDialogue(context);
                      //                             },
                      //                             child: Icon(
                      //                               Icons.delete_outline,
                      //                               color: ColorConstant.red,
                      //                               size: 20,
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       SizedBox(
                      //                         width: 15,
                      //                       ),
                      //                       Row(
                      //                         children: [
                      //                           GestureDetector(
                      //                             onTap: () {
                      //                               Get.to(
                      //                                   () =>
                      //                                       ReqConfirmScreen(),
                      //                                   transition: Transition
                      //                                       .rightToLeftWithFade);
                      //                             },
                      //                             child: Icon(
                      //                               Icons.email,
                      //                               color: ColorConstant
                      //                                   .lightBlue2,
                      //                               size: 20,
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       )
                      //                     ],
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //====================
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(String value, BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: bookingdController.selectedValue.value,
              onChanged: (selected) =>
                  bookingdController.setSelectedValue(value),
            ),
            Text(value,
                style: TextStyle(
                    color: ColorConstant.black,
                    fontSize: MediaQuery.of(context).size.height * 0.016)),
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
          'Selected Value: ${bookingdController.selectedValue}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  showDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text('Delete?', style: TextStyle(fontSize: 17)),
            content: const Text('Are you sure want to delete?',
                style: TextStyle(fontSize: 14)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0)))),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 219, 61, 61))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Delete"))
            ],
          ),
        );
      },
    );
  }
}
