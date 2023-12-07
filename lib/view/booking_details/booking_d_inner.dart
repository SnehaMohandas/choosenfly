import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_inn_controller.dart';
import 'package:choose_n_fly/view/booking_details/guest_dtail_edit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BookingInnerpage extends StatelessWidget {
  BookingInnerpage({super.key});
  var bookInnController = Get.put(BookingInnController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // toolbarHeight: 82,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Booking Details',
          style: TextStyle(
              color: ColorConstant.black,
              fontSize: MediaQuery.of(context).size.height * 0.023),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 5,
                color: Colors.yellow,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF98C3EC),
                    Color(0xFF7788E0),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                // color: Colors.amber,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 6, bottom: 6, left: 6, right: 10),
                      width: MediaQuery.of(context).size.width * 0.23,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/a1/9c/80/essentia-luxury-hotel.jpg?w=700&h=-1&s=1"),
                              fit: BoxFit.cover)),
                    ),
                    const Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jumerah creekside Hotel",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Dubai-United Arab Emirates",
                          style: TextStyle(
                              fontSize: 13,
                              // fontWeight: FontWeight.bold,
                              color: ColorConstant.white),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 212, 233, 239),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                color: ColorConstant.lightBlue,
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.person,
                                    color: ColorConstant.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ali Homoud kyhh",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13.5),
                                    ),
                                    Text(
                                      "Agent Name",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: ColorConstant.lightBlue2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                color: ColorConstant.lightBlue,
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.arrow_circle_up_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "566434434444444443",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13.5),
                                    ),
                                    Text(
                                      "Reference Code",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: ColorConstant.lightBlue2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                color: ColorConstant.lightBlue,
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.book_online_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CNF_BOOK454332233",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13.5),
                                    ),
                                    Text(
                                      "Booking Code",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: ColorConstant.lightBlue2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      color: ColorConstant.lightBlue,
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "10/11/2023",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 13.5),
                                          ),
                                          Text(
                                            "Booking Date",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      color: ColorConstant.lightBlue,
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "20/11/2023",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 13.5),
                                          ),
                                          Text(
                                            "Deadline Date",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                //  height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 239),
                  // border: Border.all(color: ColorConstant.grey),
                  // borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        //height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: ColorConstant.lightBlue,
                                        size: 15,
                                      ),
                                      Text(
                                        "  Check-In",
                                        style: TextStyle(
                                            color: ColorConstant.lightBlue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.017),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Obx(
                                    () => bookInnController
                                                    .newCheckinDate.value !=
                                                "" &&
                                            bookInnController
                                                    .newCheckoutDate.value !=
                                                "" &&
                                            bookInnController
                                                    .isDateShown.value ==
                                                true
                                        ? Text(
                                            bookInnController
                                                .newCheckinDate.value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016),
                                          )
                                        : Text(
                                            "Nov-20-2023",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016),
                                          ),
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   width: 80,
                              // ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: ColorConstant.lightBlue,
                                        size: 15,
                                      ),
                                      Text(
                                        "  Check-Out",
                                        style: TextStyle(
                                            color: ColorConstant.lightBlue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.017),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Obx(
                                    () => bookInnController
                                                    .newCheckinDate.value !=
                                                "" &&
                                            bookInnController
                                                    .newCheckoutDate.value !=
                                                "" &&
                                            bookInnController
                                                    .isDateShown.value ==
                                                true
                                        ? Text(
                                            bookInnController
                                                .newCheckoutDate.value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016),
                                          )
                                        : Text(
                                            "30-Dec-2023",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016),
                                          ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: ColorConstant.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Accommodation Details   ",
                                  style: TextStyle(
                                      color: ColorConstant.lightBlue,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017),
                                ),
                                const Icon(
                                  Icons.info_outline,
                                  color: ColorConstant.lightBlue,
                                  size: 15,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: GestureDetector(
                          onTap: () {
                            bookInnController.isTapped.value =
                                !bookInnController.isTapped.value;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1 Room - 1 Adult, 0 Children",
                                style: TextStyle(
                                    fontFamily: "Plus Jakarta Sans",
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.016),
                              ),
                              GestureDetector(
                                onTap: () {
                                  bookInnController.isTapped.value =
                                      !bookInnController.isTapped.value;
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: ColorConstant.lightBlue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Obx(() => bookInnController.isTapped.value == true
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Room ${index + 1}",
                                            style: TextStyle(
                                                fontFamily: "Plus Jakarta Sans",
                                                color: ColorConstant.lightBlue,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.017),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          Text(
                                            "1 Adult, 0 Children",
                                            style: TextStyle(
                                                fontFamily: "Plus Jakarta Sans",
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.016),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            )
                          : const SizedBox())
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                "Payment Summary",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.lightBlue,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "149 AED",
                    style: TextStyle(
                        color: ColorConstant.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("GST(10 %)", style: TextStyle(fontSize: 11)),
                  Text("10 AED",
                      style: TextStyle(
                          color: ColorConstant.primaryColor, fontSize: 11))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                "Customer Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.lightBlue,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstant.grey)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name : ",
                            style: TextStyle(
                                fontSize: 13, color: ColorConstant.lightBlue2),
                          ),
                          Text(
                            "Zhang Liyou",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              "Contact No  : ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColorConstant.lightBlue2),
                            ),
                            Text(
                              "9876543210",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "E-mail : ",
                            style: TextStyle(
                                fontSize: 13, color: ColorConstant.lightBlue2),
                          ),
                          Text(
                            "Zh@gmail.com",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              "Passport No : ",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColorConstant.lightBlue2),
                            ),
                            Text(
                              "56TRE3442",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "LPO : ",
                            style: TextStyle(
                                fontSize: 13, color: ColorConstant.lightBlue2),
                          ),
                          Text(
                            "675ER",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13)),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorConstant.white)),
                    onPressed: () {
                      cancelDialogue(context);
                    },
                    child: const Text("Cancel Booking",
                        style: TextStyle(
                            color: ColorConstant.primaryColor,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }

  cancelDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title:
                const Text('Cancel Booking?', style: TextStyle(fontSize: 16)),
            content: const Text(
              'Are you sure want to cancel this booking?',
              style: TextStyle(fontSize: 13),
            ),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0)))),
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.primaryColor)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Yes"))
            ],
          ),
        );
      },
    );
  }
}
