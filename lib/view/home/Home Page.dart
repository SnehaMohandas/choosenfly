// import 'package:choose_n_fly/utils/clr_constant.dart';
// import 'package:choose_n_fly/utils/text_styles.dart';
// import 'package:choose_n_fly/view/calender/calender.dart';
// import 'package:choose_n_fly/view/home/Home%20widgets/Category%20Circle%20Button.dart';
// import 'package:choose_n_fly/view/home/Home%20widgets/Custom%20Status%20Card%20.dart';
// import 'package:choose_n_fly/view/accommodation/accomodation.dart';
// import 'package:choose_n_fly/view/home/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   int selectedTabIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     var homeController = Get.put(HomeController());
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 365,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topRight,
//                       end: Alignment.bottomLeft,
//                       colors: [
//                         Color(0xFFB6DEDE),
//                         Color(0xFF98C3EC),
//                         Color(0xFF7788E0),
//                         Color(0xFF7788E0)
//                       ],
//                     ),
//                     border: Border()),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Spacer(),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Available Limits',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 16)),
//                             Text('5,00,000 ',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 25)),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 50,
//                         ),
//                         Spacer(),
//                         Image.asset('assets/images/image 1.png'),
//                         Spacer()
//                       ],
//                     ),
//                     Container(
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                       ),
//                       margin:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                       width: double.infinity,
//                       child: Obx(
//                         () => Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 homeController.selecedTab.value = 0;
//                               },
//                               child: tabbar1(homeController, 0, "New Booking"),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 homeController.selecedTab.value = 1;
//                               },
//                               child: tabbar1(homeController, 1, "Accounts"),
//                             ),
//                             GestureDetector(
//                               onTap: () async {
//                                 homeController.selecedTab.value = 2;
//                                 Get.to(() => CalenderPAge());
//                               },
//                               child: tabbar1(homeController, 2, "Calender"),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 22,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(
//                               builder: (context) {
//                                 return AccommodationScreen();
//                               },
//                             ));
//                           },
//                           child: CategoryCircleBtn(
//                             imagePath: 'assets/images/image 2.png',
//                             text: 'Accommodation',
//                             fontSize: 11,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: CategoryCircleBtn(
//                             imagePath: 'assets/images/image 3 (1).png',
//                             text: 'Flights',
//                             fontSize: 11,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: CategoryCircleBtn(
//                             imagePath: 'assets/images/image 4.png',
//                             text: 'Tranfer',
//                             fontSize: 11,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: CategoryCircleBtn(
//                             imagePath: 'assets/images/image 5.png',
//                             text: 'Tours and Activity',
//                             fontSize: 11,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 22,
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: CategoryCircleBtn(
//                             imagePath: 'assets/images/holiday.png',
//                             text: 'Holiday Packages',
//                             fontSize: 11,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               ////////////////////////Dash Board/////////////////////////////////////////////////////////////////////////////
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border(
//                       top: BorderSide(
//                     color: Colors.yellow,
//                     width: 5.0,
//                   )),
//                   color: Colors.white,
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 10,
//                         left: 20,
//                         right: 20,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Dashboard',
//                             style: TextStyle(
//                                 color: ColorConstant.primaryColor,
//                                 fontWeight: FontWeight.normal,
//                                 fontSize: 16),
//                           ),
//                           Spacer(),
//                           Container(
//                             height: 25,
//                             width: 70,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Color.fromRGBO(53, 59, 163, 0.76),
//                             ),
//                             child: Center(
//                               child: Text('View All',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 9)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     /////////////////////////////Row1////////////////////////////////////////////////////////////////////////////
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 27),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           CustomStatsCard(
//                             title: 'Total\nBooking',
//                             value: '20',
//                             iconImagePath: 'assets/images/External.png',
//                             iconBackgroundColor: Color(0xFF48BDE2),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 14, right: 14),
//                             child: CustomStatsCard(
//                               title: 'Todays\nCheck-In  ',
//                               value: '0',
//                               iconImagePath: 'assets/images/External.png',
//                               iconBackgroundColor: Color(0xFFE24897),
//                             ),
//                           ),
//                           CustomStatsCard(
//                             title: 'Total\nCheck-Out',
//                             value: '1',
//                             iconImagePath: 'assets/images/External.png',
//                             iconBackgroundColor: Colors.teal,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ////////////////////////Row2 ///////////////////////////////////////////////////////////////////////////
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 27),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           CustomStatsCard(
//                             title: 'Total\nCancellation',
//                             value: '2',
//                             iconImagePath: 'assets/images/External.png',
//                             iconBackgroundColor: Color(0xFF40C756),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 14, right: 14),
//                             child: CustomStatsCard(
//                               title: 'Todays\n Check-in ',
//                               value: '1',
//                               iconImagePath: 'assets/images/External.png',
//                               iconBackgroundColor: Color(0xFF48BDE2),
//                             ),
//                           ),
//                           CustomStatsCard(
//                             title: 'Used\nCredits',
//                             value: '0',
//                             iconImagePath: 'assets/images/External.png',
//                             iconBackgroundColor: Color(0xFFFE6969),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget tabbar1(HomeController homeController, int tabIndex, String title) {
//   return Container(
//     child: Text(
//       title,
//       style: TextStyle(
//         color: homeController.selecedTab.value == tabIndex
//             ? ColorConstant.white
//             : ColorConstant.primaryColor,
//       ),
//     ),
//     padding: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: homeController.selecedTab.value == tabIndex
//           ? ColorConstant.primaryColor
//           : ColorConstant.white,
//       borderRadius: homeController.selecedTab.value == tabIndex
//           ? BorderRadius.circular(10)
//           : null,
//     ),
//   );
// }

//============================
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/booking_details/booking_dtail.dart';
import 'package:choose_n_fly/view/calender/calender.dart';
import 'package:choose_n_fly/view/home/Home%20widgets/Category%20Circle%20Button.dart';
import 'package:choose_n_fly/view/home/Home%20widgets/Custom%20Status%20Card%20.dart';
import 'package:choose_n_fly/view/accommodation/accomodation.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';
import 'package:choose_n_fly/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 5;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.47,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFB6DEDE),
                    Color(0xFF98C3EC),
                    Color(0xFF7788E0),
                    Color(0xFF7788E0)
                  ],
                ),
                border: Border()),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => Profile(),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Available Limits',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02)),
                              Text('5,00,000 ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03
                                      //fontSize: 24
                                      )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Spacer(),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              "assets/images/logo.png",
                            ),
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                          )),
                        ),
                        // const Spacer()
                      ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  //height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            homeController.selecedTab.value = 0;
                          },
                          child: tabbar1(
                              homeController, 0, "New Booking", context),
                        ),
                        GestureDetector(
                          onTap: () {
                            homeController.selecedTab.value = 1;
                          },
                          child:
                              tabbar1(homeController, 1, "Accounts", context),
                        ),
                        GestureDetector(
                          onTap: () async {
                            homeController.selecedTab.value = 2;
                            Get.to(() => CalenderPAge());
                          },
                          child:
                              tabbar1(homeController, 2, "Calender", context),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => AccommodationScreen(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: CategoryCircleBtn(
                          imagePath: 'assets/images/accommodation.png',
                          text: 'Accommodation',
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CategoryCircleBtn(
                          imagePath: 'assets/images/flight.png',
                          text: 'Flights',
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CategoryCircleBtn(
                          imagePath: 'assets/images/transfer.png',
                          text: 'Tranfer',
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CategoryCircleBtn(
                          imagePath: 'assets/images/tours.png',
                          text: 'Tours and Activity',
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CategoryCircleBtn(
                          imagePath: 'assets/images/holiday_pkg.png',
                          text: 'Holiday Packages',
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
            color: Colors.yellow,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                      color: ColorConstant.primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
                // const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(() => BookingDetail(),
                        transition: Transition.rightToLeftWithFade);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.037,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(53, 59, 163, 0.76),
                    ),
                    child: Center(
                      child: Text('View All Bookings',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.014)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              //color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomStatsCard(
                          title: 'Total\nHotels',
                          value: '543',
                          icon: Icon(
                            FontAwesomeIcons.hotel,
                            size: 18,
                            color: ColorConstant.white,
                          ),
                          iconBackgroundColor: Color(0xFF48BDE2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: CustomStatsCard(
                            icon: Icon(Icons.calendar_month,
                                size: 22, color: ColorConstant.white),
                            title: 'Todays\nCheck-In  ',
                            value: '0',
                            iconBackgroundColor: Color(0xFFE24897),
                          ),
                        ),
                        CustomStatsCard(
                          icon: Icon(Icons.calendar_month,
                              size: 22, color: ColorConstant.white),
                          title: 'Total\nCheck-Out',
                          value: '1',
                          iconBackgroundColor: Colors.teal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomStatsCard(
                          icon: Icon(Icons.cancel,
                              size: 22, color: ColorConstant.white),
                          title: 'Total\nCancellation',
                          value: '2',
                          iconBackgroundColor: Color(0xFF40C756),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: CustomStatsCard(
                            icon: Icon(Icons.pending_outlined,
                                size: 22, color: ColorConstant.white),
                            title: 'Pending\nConfirmation',
                            value: '1',
                            iconBackgroundColor: ColorConstant.signBlue,
                          ),
                        ),
                        CustomStatsCard(
                          icon: Icon(FontAwesomeIcons.wallet,
                              size: 18, color: ColorConstant.white),
                          title: 'Used\nCredits',
                          value: '0',
                          iconBackgroundColor: Color(0xFFFE6969),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget tabbar1(HomeController homeController, int tabIndex, String title,
    BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.04,
    //padding: EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: homeController.selecedTab.value == tabIndex
          ? ColorConstant.primaryColor
          : ColorConstant.white,
      borderRadius: homeController.selecedTab.value == tabIndex
          ? BorderRadius.circular(10)
          : null,
    ),

    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: TextStyle(
            color: homeController.selecedTab.value == tabIndex
                ? ColorConstant.white
                : ColorConstant.primaryColor,
          ),
        ),
      ),
    ),
  );
}
