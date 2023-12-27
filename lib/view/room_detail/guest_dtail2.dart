import 'package:choose_n_fly/network/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';

import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GuestDetail2 extends StatelessWidget {
  GuestDetail2(
      {super.key,
      required this.roomController,
      required this.acController,
      required this.adultCounts,
      required this.childCounts,
      required this.childAgeLists});
  final RoomController2 roomController;
  final AccomodationController acController;
  final List adultCounts;
  final List childCounts;
  final List childAgeLists;
  final NetworkController networkController = Get.find<NetworkController>();

  var rooms = [1, 2, 3, 4];
  var adults = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  var children = [0, 1, 2, 3, 4, 5];
  final List ageController = [TextEditingController()];
  var childAgeList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //List<String> allAgeOrgs = [];
  List? mappedAges;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, centerTitle: true,
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
              'Accommodation Details',
              style: TextStyle(
                  color: ColorConstant.black,
                  fontSize: MediaQuery.of(context).size.height * 0.023),
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 25, bottom: 14),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  // GestureDetector(
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Icon(Icons.arrow_back)),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(
                      "Rooms",
                      style: TextStyle(
                        color: ColorConstant.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  //room dropdown
                  Obx(
                    () => DropdownButtonFormField<String>(
                        value: roomController.roomCount.value != ""
                            ? roomController.roomCount.value
                            // : roomCounts != ""
                            //     ? roomCounts.toString()
                            // : acController.roomCount.value != ""
                            //     ? acController.roomCount.value
                            : null,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            // labelText: "Rooms",
                            // labelStyle: TextStyle(
                            //     color: ColorConstant.liteBlack, fontSize: 14),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: ColorConstant.lightBlue2,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: ColorConstant.lightBlue2,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                        items: rooms.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.toString(),
                            child: Text(item.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          roomController.selectedDdindex.clear();

                          roomController.selectedChildIndex.value = "";
                          roomController.selectedDdindex = [];
                          roomController.childDdnum.value = [];
                          roomController.adultDdnum.value = [];
                          roomController.ageTextControllers = [];

                          roomController.roomCount.value = newValue.toString();
                          // print(roomController.roomCount.value);
                          for (int i = 0;
                              i <
                                  int.parse(roomController.roomCount.value
                                      .toString());
                              i++) {
                            roomController.selectedDdindex.add("false");
                            roomController.childDdnum.value.add(0);
                            roomController.adultDdnum.value.add(0);
                            roomController.ageTextControllers.add([]);
                          }
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const DottedLine(
                    direction: Axis.horizontal,
                    lineThickness: 0.5,
                    dashColor: ColorConstant.lightBlue2,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  // Obx(
                  //   () =>
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: roomController.roomCount.value != ""
                              ? int.parse(roomController.roomCount.value)
                              : 0,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    //adult dropdown
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 4),
                                            child: GestureDetector(
                                              onTap: () {
                                                print("tt");
                                                print(roomController
                                                    .adultDdnum.value.length);
                                                print(roomController
                                                    .adultDdnum.value[index]);
                                              },
                                              child: const Text(
                                                "Adults",
                                                style: TextStyle(
                                                  color: ColorConstant.black,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => DropdownButtonFormField<
                                                    String>(
                                                //  value: null,
                                                value: roomController.adultDdnum
                                                                .value.length ==
                                                            0 ||
                                                        roomController
                                                                .adultDdnum
                                                                .value[index] ==
                                                            0
                                                    ? null
                                                    : roomController.adultDdnum
                                                        .value[index],
                                                //===============

                                                // value: roomController
                                                //             .adultDdnum
                                                //             .value
                                                //             .length==0 ||
                                                //         roomController
                                                //                     .adultDdnum
                                                //                     .value[
                                                //                 index] ==
                                                //             0
                                                //     ? roomController
                                                //         .adultDdnum
                                                //         .value[index]
                                                //     : adultCounts.isNotEmpty
                                                //         ? adultCounts[index]
                                                //             .toString()
                                                //         : null,
                                                //=============
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'Please select an option';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 4),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                              color: ColorConstant
                                                                  .lightBlue2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10)),
                                                    border: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: ColorConstant
                                                              .lightBlue2,
                                                        ),
                                                        borderRadius: BorderRadius.circular(10))),
                                                items: adults.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  roomController
                                                          .adultDdnum[index] =
                                                      newValue;
                                                }),
                                          ),
                                        ],
                                      ),
                                      // ),
                                    ),
                                    //),

                                    const SizedBox(
                                      width: 10,
                                    ),
                                    //children dropdown
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 4),
                                            child: Text(
                                              "Children",
                                              style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => DropdownButtonFormField<
                                                    String>(
                                                value: roomController.childDdnum
                                                                .value.length ==
                                                            0 ||
                                                        roomController
                                                                .childDdnum
                                                                .value[index] ==
                                                            0
                                                    ? null
                                                    : roomController.childDdnum
                                                        .value[index],
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 4),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                              color: ColorConstant
                                                                  .lightBlue2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10)),
                                                    border: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color: ColorConstant
                                                              .lightBlue2,
                                                        ),
                                                        borderRadius: BorderRadius.circular(10))),
                                                items: children.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  roomController
                                                      .selectedChildIndex
                                                      .value = index.toString();

                                                  roomController
                                                          .selectedDdindex[
                                                      index] = "true";

                                                  roomController
                                                          .childDdnum[index] =
                                                      newValue;

                                                  print(roomController
                                                      .ageTextControllers);
                                                  print(roomController
                                                      .childDdnum[index]);
                                                  print(index);
                                                  print(roomController
                                                      .ageTextControllers);

                                                  //"""""""""""''''"

                                                  roomController
                                                      .ageTextControllers[index]
                                                      .clear();
                                                  roomController
                                                              .ageTextControllers[
                                                          index] =
                                                      List.generate(
                                                          int.parse(
                                                              roomController
                                                                  .childDdnum[
                                                                      index]
                                                                  .toString()),
                                                          (index) =>
                                                              TextEditingController());

                                                  print(
                                                      "allllll=>>>${roomController.ageTextControllers}");
                                                  print(
                                                      "specificcccc===>${roomController.ageTextControllers[index]}");
                                                }),
                                          ),

                                          //children's age
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Obx(() => roomController
                                                .selectedChildIndex.value ==
                                            index.toString() ||
                                        roomController.selectedDdindex[index] ==
                                            "true"
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 4),
                                            child: Obx(
                                              () => roomController.childDdnum
                                                          .value[index] ==
                                                      "0"
                                                  ? const SizedBox()
                                                  : GestureDetector(
                                                      onTap: () {},
                                                      child: const Text(
                                                        "Children's Age",
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .black,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 10,
                                                      mainAxisExtent:
                                                          roomController
                                                                      .isValidate
                                                                      .value ==
                                                                  true
                                                              ? 70
                                                              : 50,
                                                      mainAxisSpacing: 10),
                                              itemCount: int.parse(
                                                  roomController
                                                      .childDdnum[index]
                                                      .toString()),
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemBuilder:
                                                  (context, childIndex) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp("[0-9]")),
                                                    ],
                                                    controller: roomController
                                                            .ageTextControllers[
                                                        index][childIndex],
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 3,
                                                              horizontal: 14),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: ColorConstant
                                                                    .lightBlue2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: ColorConstant
                                                                    .lightBlue2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value == "") {
                                                        roomController
                                                            .isValidate
                                                            .value = true;
                                                        return "Please enter age";
                                                      } else if (int.parse(
                                                              value) >
                                                          10) {
                                                        roomController
                                                            .isValidate
                                                            .value = true;
                                                        return "Age must be below 10";
                                                      } else if (int.parse(
                                                              value) <
                                                          1) {
                                                        roomController
                                                            .isValidate
                                                            .value = true;
                                                        return "Incorrect age";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                );
                                              }),
                                        ],
                                      )
                                    : const SizedBox()),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: DottedLine(
                                    direction: Axis.horizontal,
                                    lineThickness: 0.5,
                                    dashColor: ColorConstant.lightBlue2,
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  //),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.046,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.white)),
                              onPressed: () {
                                if (roomController.isSubLoading.value == true) {
                                  print("object");
                                  roomController.roomCount.value = "";
                                  roomController.selectedDdindex.clear();

                                  roomController.selectedChildIndex.value = "";
                                  roomController.selectedDdindex = [];
                                  roomController.childDdnum.value = [];
                                  roomController.adultDdnum.value = [];
                                  roomController.ageTextControllers = [];
                                }
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Close",
                                style: TextStyle(
                                    color: ColorConstant.primaryColor,
                                    fontSize: 14),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.046,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.primaryColor)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  roomController.isSubLoading.value = true;
                                  //==========

                                  // childAgeList.clear();
                                  //=============
                                  roomController.allAgeOrgs.clear();
                                  num adultSum = roomController.adultDdnum
                                      .fold(0, (previous, current) {
                                    if (current is num) {
                                      return previous + current;
                                    } else if (current is String) {
                                      // Attempt to parse the string to a num and provide a default value of 0 if parsing fails
                                      return previous +
                                          (num.tryParse(current) ?? 0);
                                    } else {
                                      return previous;
                                    }
                                  });

                                  print(
                                      'Sum of the list: ${adultSum.toString()}');
                                  num childSum = roomController.childDdnum
                                      .fold(0, (previous, current) {
                                    if (current is num) {
                                      return previous + current;
                                    } else if (current is String) {
                                      // Attempt to parse the string to a num and provide a default value of 0 if parsing fails
                                      return previous +
                                          (num.tryParse(current) ?? 0);
                                    } else {
                                      return previous;
                                    }
                                  });
                                  print(
                                      'Sum of the list: ${childSum.toString()}');
                                  roomController.guestTotal.value =
                                      adultSum.toInt() + childSum.toInt();
                                  print("totallll${roomController.guestTotal}");
                                  print(
                                      "room count${roomController.roomCount.value}");

                                  print(
                                      "adult count list ${roomController.adultDdnum}");
                                  print(
                                      "child count list${roomController.childDdnum}");
                                  print(roomController.ageTextControllers);
                                  roomController.newRoomCount.value =
                                      roomController.roomCount.value;
                                  for (int i = 0;
                                      i <
                                          int.parse(roomController
                                              .newRoomCount.value
                                              .toString());
                                      i++) {
                                    mappedAges = roomController
                                        .ageTextControllers[i]
                                        .map((e) => e.text)
                                        .toList();

                                    roomController.allAgeOrgs.add(mappedAges!);
                                  }

                                  roomController.accommodationDetails =
                                      getEnteredData(
                                          acController, roomController);
                                  print(roomController.accommodationDetails);
                                  roomController.isSubLoading.value = false;

                                  Get.back();

                                  //===================test
                                  // for (int i = 0;
                                  //     i <
                                  //         int.parse(roomController
                                  //             .roomCount.value
                                  //             .toString());
                                  //     i++) {
                                  //   for (int j = 0;
                                  //       j <
                                  //           roomController
                                  //               .ageTextControllers![i]
                                  //               .length;
                                  //       j++) {
                                  //     if (roomController
                                  //         .ageTextControllers[i].isNotEmpty) {
                                  //       mappedAges = roomController
                                  //           .ageTextControllers[i]
                                  //           .map((e) => e.text)
                                  //           .join(', ');
                                  //     }
                                  //   }
                                  //   if (roomController
                                  //       .ageTextControllers[i].isNotEmpty) {
                                  //     roomController.allAgeOrgs
                                  //         .add(mappedAges!);
                                  //   }
                                  // }
                                  // if (roomController.allAgeOrgs.isEmpty ||
                                  //     roomController.allAgeOrgs == []) {
                                  //   print("object");
                                  // } else {
                                  //   print(roomController.allAgeOrgs);
                                  // }
                                  //==============

                                  //for age in one list
                                  //===================

                                  // for (int i = 0;
                                  //     i <
                                  //         roomController
                                  //             .ageTextControllers!.length;
                                  //     i++) {
                                  //   for (int j = 0;
                                  //       j <
                                  //           roomController
                                  //               .ageTextControllers![i].length;
                                  //       j++) {
                                  //     childAgeList.add(roomController
                                  //         .ageTextControllers[i][j].text);
                                  //     print(
                                  //         "Room $i, Child $j: ${roomController.ageTextControllers![i][j].text}");
                                  //   }

                                  //   // }
                                  // }
                                  // print(childAgeList.toString());
                                  //========================
                                }
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: ColorConstant.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }

  List<Map<String, dynamic>> getEnteredData(
      AccomodationController acController, RoomController2 roomController) {
    List<Map<String, dynamic>> dataList = [];

    var length = roomController.newRoomCount.value != ""
        ? roomController.newRoomCount.value
        : 1;

    for (int i = 0; i < int.parse(length.toString()); i++) {
      print("this is childcount${roomController.ageTextControllers[i]}");
      Map<String, dynamic> data = {
        "room no": roomController.newRoomCount.value != ""
            ? (i + 1).toString()
            : 0.toString(),
        'adult': roomController.adultDdnum[i] != 0
            ? roomController.adultDdnum[i]
            : 0.toString(),
        'children': roomController.childDdnum[i] == 0
            ? 0.toString()
            : roomController.childDdnum[i] != 0
                ? roomController.childDdnum[i]
                // : acController.childDdnum[i] != 0
                //     ? acController.childDdnum[i]
                : 0.toString(),
        if (roomController.allAgeOrgs[i].isNotEmpty)
          "children age": roomController.allAgeOrgs[i]
        else if (roomController.allAgeOrgs[i].isEmpty)
          "Children age": []

        //if (allAgeOrgs.isNotEmpty) 'children age': allAgeOrgs[i].toString()
      };

      dataList.add(data);
    }

    return dataList;
  }
}
