import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/shimmer/home.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/booking_details/booking_dtail.dart';
import 'package:choose_n_fly/view/calender/calender.dart';
import 'package:choose_n_fly/view/cart/cart_screen.dart';
import 'package:choose_n_fly/view/coming_soon/coming_soon.dart';
import 'package:choose_n_fly/view/home/Home%20widgets/Category%20Circle%20Button.dart';
import 'package:choose_n_fly/view/home/Home%20widgets/Custom%20Status%20Card%20.dart';
import 'package:choose_n_fly/view/accommodation/accomodation.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';
import 'package:choose_n_fly/view/profile/profile.dart';
import 'package:choose_n_fly/view/splash/controller/splash_controller.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final NetworkController networkController = Get.put(NetworkController());

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        var homeController = Get.put(HomeController());

        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            exitDialogue(context);
          },
          child: Scaffold(
            body:
                //Obx(
                // () => homeController.isLoading.value == true
                //     ? Center(child: HomeShimmer())
                //     : homeController.exceptionCatched.value == true
                //         ? const Center(
                //             child: Text(
                //               "SERVER  ERROR",
                //               style: TextStyle(
                //                   fontSize: 16,
                //                   color: ColorConstant.red,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //           )
                //         :
                Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
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
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //const Spacer(),
                              Obx(
                                () => homeController.isLoading.value == true
                                    ? CircularProgressIndicator()
                                    : homeController.exceptionCatched.value ==
                                            true
                                        ? const Center(
                                            child: Icon(
                                              Icons.error,
                                              color: ColorConstant.black,
                                            ),
                                            // child: Text(
                                            //   "SERVER  ERROR",
                                            //   style: TextStyle(
                                            //       fontSize: 16,
                                            //       color: ColorConstant.red,
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                () => Profile(
                                                  // avLimit: "50000",
                                                  // crediLimit: "300000",
                                                  avLimit: homeController
                                                      .walletModel!
                                                      .availableLimit
                                                      .toString(),
                                                  crediLimit: homeController
                                                      .walletModel!.creditlimit
                                                      .toString(),
                                                ),
                                              );
                                            },
                                            // child: Column(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            //     Text('Available Limits',
                                            //         style: TextStyle(
                                            //             color: Colors.white,
                                            //             fontWeight:
                                            //                 FontWeight.normal,
                                            //             fontSize:
                                            //                 MediaQuery.of(context)
                                            //                         .size
                                            //                         .height *
                                            //                     0.02)),
                                            //     Text(
                                            //         homeController.walletModel!
                                            //             .availableLimit
                                            //             .toString(),
                                            //         style: TextStyle(
                                            //             color: Colors.white,
                                            //             fontWeight:
                                            //                 FontWeight.bold,
                                            //             fontSize:
                                            //                 MediaQuery.of(context)
                                            //                         .size
                                            //                         .height *
                                            //                     0.03
                                            //             //fontSize: 24
                                            //             )),
                                            //   ],
                                            // ),
                                            child: const CircleAvatar(
                                              backgroundColor:
                                                  ColorConstant.grey,
                                              maxRadius: 24,
                                              child: CircleAvatar(
                                                maxRadius: 22,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.person,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
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
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
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
                                  Get.to(() => ComingSoon(),
                                      transition:
                                          Transition.leftToRightWithFade);
                                },
                                child: tabbar1(
                                    homeController, 1, "Accounts", context),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  homeController.selecedTab.value = 2;
                                  Get.to(() => CalenderPAge(),
                                      transition:
                                          Transition.rightToLeftWithFade);
                                },
                                child: tabbar1(
                                    homeController, 2, "Calendar", context),
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
                                color: Color.fromARGB(255, 146, 141, 141),
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => ComingSoon(),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: CategoryCircleBtn(
                                color: Color.fromARGB(255, 190, 139, 156),
                                imagePath: 'assets/images/flight.png',
                                text: 'Flights',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => ComingSoon(),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: CategoryCircleBtn(
                                color: Color.fromARGB(255, 158, 155, 206),
                                imagePath: 'assets/images/transfer.png',
                                text: 'Tranfer',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => ComingSoon(),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: CategoryCircleBtn(
                                color: Color.fromARGB(255, 187, 159, 107),
                                imagePath: 'assets/images/tours.png',
                                text: 'Tours and Activity',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
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
                              onTap: () {
                                Get.to(() => ComingSoon(),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: CategoryCircleBtn(
                                color: Color.fromARGB(255, 87, 167, 107),
                                imagePath: 'assets/images/holiday_pkg.png',
                                text: 'Holiday Packages',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
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
                      // Text(
                      //   'Dashboard',
                      //   style: TextStyle(
                      //       color: ColorConstant.primaryColor,
                      //       fontWeight: FontWeight.normal,
                      //       fontSize: 16),
                      // ),
                      // const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => BookingDetail(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.037,
                          width: MediaQuery.of(context).size.width * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(53, 59, 163, 0.76),
                          ),
                          child: Center(
                            child: Text('View Bookings',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.014)),
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(() => CartScreen(),
                      //         transition:
                      //             Transition.rightToLeftWithFade);
                      //   },
                      //   child: Container(
                      //     child: Row(
                      //       children: [
                      //         Container(
                      //             height: 35,
                      //             width: 35,
                      //             decoration: BoxDecoration(
                      //               borderRadius:
                      //                   BorderRadius.circular(8),
                      //               // boxShadow: [
                      //               //   BoxShadow(
                      //               //     color: Colors.grey.withOpacity(0.4),
                      //               //     blurRadius: 4,
                      //               //     offset: const Offset(2, 8),
                      //               //   ),
                      //               // ],
                      //               color: const Color.fromARGB(
                      //                   193, 140, 145, 230),
                      //             ),
                      //             child: const Icon(
                      //               Icons.shopping_cart_outlined,
                      //               color: ColorConstant.white,
                      //             )),
                      //         const Icon(
                      //           Icons.navigate_next,
                      //           color: Color.fromARGB(
                      //               193, 140, 145, 230),
                      //         )
                      //         //  Text(" View cart")
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Obx(
                  () => homeController.isLoading.value == true
                      ? HomeShimmer()
                      : homeController.exceptionCatched.value == true
                          ? const Center(
                              child: Text(
                                "SERVER  ERROR",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstant.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                //color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomStatsCard(
                                            title: 'Available\nLimit',
                                            value: homeController
                                                    .dashboardCountModel!
                                                    .data
                                                    .availableLimit
                                                    .data
                                                    .round()
                                                    .toString() ??
                                                "",
                                            icon: const Icon(
                                              FontAwesomeIcons.hotel,
                                              size: 18,
                                              color: ColorConstant.white,
                                            ),
                                            iconBackgroundColor:
                                                const Color(0xFF48BDE2),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 14, right: 14),
                                            child: CustomStatsCard(
                                              icon: const Icon(
                                                  FontAwesomeIcons
                                                      .calendarCheck,
                                                  size: 18,
                                                  color: ColorConstant.white),
                                              title: 'Todays\nCheck-In  ',
                                              value: homeController
                                                      .dashboardCountModel!
                                                      .data
                                                      .checkIn
                                                      .data
                                                      .toString() ??
                                                  "",
                                              iconBackgroundColor:
                                                  const Color(0xFFE24897),
                                            ),
                                          ),
                                          CustomStatsCard(
                                            icon: const Icon(
                                                FontAwesomeIcons.calendarXmark,
                                                size: 18,
                                                color: ColorConstant.white),
                                            title: 'Todays\nCheck-Out',
                                            value: homeController
                                                    .dashboardCountModel!
                                                    .data
                                                    .checkOut
                                                    .data
                                                    .toString() ??
                                                "",
                                            iconBackgroundColor: Colors.teal,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomStatsCard(
                                            icon: const Icon(Icons.cancel,
                                                size: 22,
                                                color: ColorConstant.white),
                                            title: 'Total\nCancellation',
                                            value: homeController
                                                    .dashboardCountModel!
                                                    .data
                                                    .cancel
                                                    .data
                                                    .toString() ??
                                                "",
                                            iconBackgroundColor:
                                                const Color(0xFF40C756),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 14, right: 14),
                                            child: CustomStatsCard(
                                              icon: const Icon(
                                                  Icons.pending_outlined,
                                                  size: 22,
                                                  color: ColorConstant.white),
                                              title: 'Pending\nConfirmation',
                                              value: homeController
                                                      .dashboardCountModel!
                                                      .data
                                                      .pending
                                                      .data
                                                      .toString() ??
                                                  "",
                                              iconBackgroundColor:
                                                  ColorConstant.signBlue,
                                            ),
                                          ),
                                          CustomStatsCard(
                                            icon: const Icon(
                                                FontAwesomeIcons.wallet,
                                                size: 18,
                                                color: ColorConstant.white),
                                            title: 'Used\nCredits',
                                            value: homeController
                                                    .dashboardCountModel!
                                                    .data
                                                    .used
                                                    .data
                                                    .round()
                                                    .toString() ??
                                                "",
                                            iconBackgroundColor:
                                                const Color(0xFFFE6969),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                )
              ],
            ),
            //),
          ),
        );
      } else {
        // Get.find<SplashController>().isNoNet.value = true;
        return networkController.noDataImage(context);
      }
    });
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

exitDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text('Are you sure want to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.primaryColor,
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: ColorConstant.white,
                ),
              ))
        ],
      );
    },
  );
}
