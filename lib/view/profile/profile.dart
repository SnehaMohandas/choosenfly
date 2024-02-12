import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/common_fctn.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/booking_details/booking_dtail.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';
import 'package:choose_n_fly/view/login/login_controller.dart';
import 'package:choose_n_fly/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  Profile({super.key, required this.avLimit, required this.crediLimit});
  final avLimit;
  final crediLimit;
  List leading = [Icons.person, Icons.email, Icons.phone];
  List title = ["Name", "E-mail", "Phone"];
  List subtitle = ["John Thomas", "jh@gmail.com", "9876543210"];
  final NetworkController networkController = Get.find<NetworkController>();
  showLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    destinationList!.clear();
    nativeList!.clear();
    // CommonFunction.addDataToSharedPreferences('logout', 'success');
    Get.offAll(SignInPage());
    Get.delete<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    print(token);
    return Obx(() {
      if (networkController.isConnected.value) {
        //var loginController = Get.put(LoginController());
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            // toolbarHeight: 82,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: Text(
              'My Profile',
              style: TextStyle(
                  color: ColorConstant.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023),
            ),
            centerTitle: true,
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         logoutDialogue(context);
            //         //  Get.offAll(() => SignInPage());
            //       },
            //       icon: const Icon(
            //         Icons.logout,
            //         color: ColorConstant.primaryColor,
            //       ))
            // ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        // height: double.maxFinite,
                        // color: Colors.yellow,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 470,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstant.lightBlue),
                                  color: ColorConstant.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: const Icon(
                                Icons.person_sharp,
                                size: 80,
                                color: Colors.grey,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      color: ColorConstant.lightBlue, width: 1)

                                  // image: DecorationImage(
                                  //     image: AssetImage(
                                  //         "assets/images/profileagent.png"),
                                  //     fit: BoxFit.fitHeight)
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              name!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            RichText(
                              text: TextSpan(
                                // Default style for all TextSpans if not overridden
                                //style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Company Name : ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: companyName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin: const EdgeInsets.all(14),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Free Vector Gradient wavy background.jpeg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Today, ${DateFormat('dd MMM yyyy').format(DateTime.now())}",
                                          style: const TextStyle(
                                            color: ColorConstant.grey,
                                            fontSize: 10,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 65,
                                          width: 65,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/IMG_20231206_145526-removebg-preview.png"),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const Spacer(),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Spacer(),
                                          const Text(
                                            "Balance",
                                            style: TextStyle(
                                              color: ColorConstant.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            avLimit,
                                            style: const TextStyle(
                                              color: ColorConstant.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "Credit Limit      :     ",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                crediLimit,
                                                style: const TextStyle(
                                                  color: ColorConstant.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Card(
                                elevation: 0.5,
                                color: Colors.grey[100],
                                child: ListTile(
                                  onTap: () {
                                    Get.to(() => BookingDetail(),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                  },
                                  title: const Text("My Bookings"),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Card(
                                elevation: 0.5,
                                color: Colors.grey[100],
                                child: ListTile(
                                  onTap: () {
                                    logoutDialogue(context);
                                  },
                                  //tileColor: Colors.white,
                                  title: const Text("Logout"),
                                  trailing: const Icon(Icons.logout_outlined),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //======================
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.2,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //       image: const DecorationImage(
                //           image: AssetImage(
                //               "assets/images/Free Vector Gradient wavy background.jpeg"),
                //           fit: BoxFit.cover),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 20),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Column(
                //           children: [
                //             const SizedBox(
                //               height: 20,
                //             ),
                //             Text(
                //               "Today, ${DateFormat('dd MMM yyyy').format(DateTime.now())}",
                //               style: TextStyle(
                //                 color: ColorConstant.grey,
                //                 fontSize: 10,
                //               ),
                //             ),
                //             const Spacer(),
                //             Container(
                //               height: 65,
                //               width: 65,
                //               decoration: const BoxDecoration(
                //                   image: DecorationImage(
                //                       image: AssetImage(
                //                           "assets/images/IMG_20231206_145526-removebg-preview.png"),
                //                       fit: BoxFit.cover)),
                //             ),
                //             const Spacer(),
                //             const SizedBox(
                //               height: 20,
                //             )
                //           ],
                //         ),
                //         Expanded(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.end,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               const Spacer(),
                //               const Text(
                //                 "Balance",
                //                 style: TextStyle(
                //                   color: ColorConstant.white,
                //                   fontSize: 16,
                //                 ),
                //               ),
                //               Text(
                //                 avLimit,
                //                 style: const TextStyle(
                //                   color: ColorConstant.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 26,
                //                 ),
                //               ),
                //               const Spacer(),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 crossAxisAlignment: CrossAxisAlignment.end,
                //                 children: [
                //                   const Text(
                //                     "Credit Limit      :     ",
                //                     style: TextStyle(
                //                       color: Colors.white70,
                //                       fontSize: 14,
                //                     ),
                //                   ),
                //                   Text(
                //                     crediLimit,
                //                     style: const TextStyle(
                //                       color: ColorConstant.white,
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 16,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //               const SizedBox(
                //                 height: 10,
                //               )
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.05,
                // ),
                // const Row(
                //   children: [
                //     Icon(
                //       Icons.person_outlined,
                //       color: ColorConstant.primaryColor,
                //     ),
                //     Text(
                //       "  Name",
                //       style:
                //           TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                //     ),
                //   ],
                // ),
                // const Divider(
                //   thickness: 1,
                //   color: ColorConstant.grey,
                // ),
                // Text(name!),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // const Row(
                //   children: [
                //     Icon(
                //       Icons.workspaces_outline,
                //       color: ColorConstant.primaryColor,
                //     ),
                //     Text(
                //       " Company Name",
                //       style:
                //           TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                //     ),
                //   ],
                // ),
                // const Divider(
                //   thickness: 1,
                //   color: ColorConstant.grey,
                // ),
                // Text(companyName!),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                //=======================
              ],
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }

  logoutDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text('Logout?', style: TextStyle(fontSize: 17)),
            content: const Text('Are you sure want to logout?',
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.primaryColor)),
                  onPressed: () async {
                    await showLogOut();
                    //Get.back();
                    //Fluttertoast.showToast(msg: "Removed from cart");
                    // Navigator.of(context).pop();
                    // Get.offAll(() => SignInPage());
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
}
