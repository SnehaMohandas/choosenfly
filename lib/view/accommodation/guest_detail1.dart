import 'package:choose_n_fly/network/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/room_detail/roomdetails2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';

class GuestDetail1 extends StatelessWidget {
  GuestDetail1({super.key, required this.acController});
  final AccomodationController acController;

  final NetworkController networkController = Get.find<NetworkController>();

  var rooms = [1, 2, 3, 4];
  var adults = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  var children = [0, 1, 2, 3, 4, 5];
  final List ageController = [TextEditingController()];
  var childAgeList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                const EdgeInsets.only(left: 18, right: 18, top: 25, bottom: 14),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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
                        value: acController.roomCount.value == ""
                            ? null
                            : acController.roomCount.value,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorConstant.lightBlue2,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
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
                          acController.selectedDdindex.clear();

                          acController.selectedChildIndex.value = "";
                          acController.selectedDdindex = [];
                          acController.childDdnum.value = [];
                          acController.adultDdnum.value = [];
                          acController.ageTextControllers = [];

                          acController.roomCount.value = newValue.toString();
                          print(acController.roomCount.value);
                          for (int i = 0;
                              i <
                                  int.parse(
                                      acController.roomCount.value.toString());
                              i++) {
                            acController.selectedDdindex.add("false");
                            acController.childDdnum.value.add(0);
                            acController.adultDdnum.value.add(0);
                            acController.ageTextControllers.add([]);
                          }

                          print(acController.roomCount.value);
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  DottedLine(
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
                          physics: BouncingScrollPhysics(),
                          itemCount: acController.roomCount.value != ""
                              ? int.parse(acController.roomCount.value)
                              : 0,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    //adult dropdown
                                    Obx(
                                      () => Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 4),
                                              child: Text(
                                                "Adults",
                                                style: TextStyle(
                                                  color: ColorConstant.black,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            DropdownButtonFormField<String>(
                                                value: acController.adultDdnum
                                                                .value.length ==
                                                            0 ||
                                                        acController.adultDdnum
                                                                .value[index] ==
                                                            0
                                                    ? null
                                                    : acController.adultDdnum
                                                        .value[index],
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'Please select an option';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 4),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: ColorConstant
                                                                  .lightBlue2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: ColorConstant
                                                              .lightBlue2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                                items: adults.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  acController
                                                          .adultDdnum[index] =
                                                      newValue;
                                                }),
                                          ],
                                        ),
                                        // ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 10,
                                    ),
                                    //children dropdown
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
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
                                                value: acController.childDdnum
                                                                .value.length ==
                                                            0 ||
                                                        acController.childDdnum
                                                                .value[index] ==
                                                            0
                                                    ? null
                                                    : acController.childDdnum
                                                        .value[index],
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 4),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: ColorConstant
                                                                  .lightBlue2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10)),
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: ColorConstant
                                                              .lightBlue2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(10))),
                                                items: children.map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item.toString(),
                                                    child:
                                                        Text(item.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  acController
                                                      .selectedChildIndex
                                                      .value = index.toString();

                                                  acController.selectedDdindex[
                                                      index] = "true";

                                                  acController
                                                          .childDdnum[index] =
                                                      newValue;

                                                  print(acController
                                                      .ageTextControllers);
                                                  print(acController
                                                      .childDdnum[index]);
                                                  print(index);
                                                  print(acController
                                                      .ageTextControllers);

                                                  //"""""""""""''''"

                                                  acController
                                                      .ageTextControllers[index]
                                                      .clear();
                                                  acController.ageTextControllers[
                                                          index] =
                                                      List.generate(
                                                          int.parse(acController
                                                              .childDdnum[index]
                                                              .toString()),
                                                          (index) =>
                                                              TextEditingController());

                                                  print(
                                                      "allllll=>>>${acController.ageTextControllers}");
                                                  print(
                                                      "specificcccc===>${acController.ageTextControllers[index]}");
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                //children's age

                                Obx(() => acController
                                                .selectedChildIndex.value ==
                                            index.toString() ||
                                        acController.selectedDdindex[index] ==
                                            "true"
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 4),
                                            child: Obx(
                                              () => acController.childDdnum
                                                          .value[index] ==
                                                      "0"
                                                  ? SizedBox()
                                                  : Text(
                                                      "Children's Age",
                                                      style: TextStyle(
                                                        color:
                                                            ColorConstant.black,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10,
                                                      mainAxisExtent:
                                                          acController.isValidate
                                                                      .value ==
                                                                  true
                                                              ? 70
                                                              : 50),
                                              itemCount: int.parse(acController
                                                  .childDdnum[index]
                                                  .toString()),
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemBuilder:
                                                  (context, childIndex) {
                                                return Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: SizedBox(
                                                    //  height: 50,
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                "[0-9]")),
                                                      ],
                                                      controller: acController
                                                              .ageTextControllers[
                                                          index][childIndex],
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(10),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
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
                                                                    BorderSide(
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
                                                          acController
                                                              .isValidate
                                                              .value = true;
                                                          return "Please enter age";
                                                        } else if (int.parse(
                                                                    value) >
                                                                10 ||
                                                            int.parse(value) <
                                                                1) {
                                                          acController
                                                              .isValidate
                                                              .value = true;
                                                          return "Age must be below 10";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ],
                                      )
                                    : const SizedBox()),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
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
                  //  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.046,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.white)),
                              onPressed: () {
                                if (acController.isSubLoading.value == true) {
                                  print("object");
                                  acController.roomCount.value = "";
                                  acController.selectedDdindex.clear();

                                  acController.selectedChildIndex.value = "";
                                  acController.selectedDdindex = [];
                                  acController.childDdnum.value = [];
                                  acController.adultDdnum.value = [];
                                  acController.ageTextControllers = [];
                                }
                                print(acController.isSubLoading.value);
                                Navigator.pop(context);
                              },
                              child: Text(
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
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.primaryColor)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  acController.isSubLoading.value = true;

                                  //childAgeList.clear();
                                  acController.allAgeOrgs.clear();
                                  print(acController.adultDdnum);
                                  num adultSum = acController.adultDdnum.fold(0,
                                      (previous, current) {
                                    if (current is num) {
                                      return previous + current;
                                    } else if (current is String) {
                                      return previous +
                                          (num.tryParse(current) ?? 0);
                                    } else {
                                      return previous;
                                    }
                                  });

                                  print('Sum of the adults: $adultSum');
                                  num childSum = acController.childDdnum.fold(0,
                                      (previous, current) {
                                    if (current is num) {
                                      return previous + current;
                                    } else if (current is String) {
                                      return previous +
                                          (num.tryParse(current) ?? 0);
                                    } else {
                                      return previous;
                                    }
                                  });
                                  print('Sum of the child: $childSum');
                                  acController.guestTotal.value =
                                      adultSum.toInt() + childSum.toInt();
                                  print(
                                      "sum of guests ${acController.guestTotal}");
                                  print(
                                      "room count${acController.roomCount.value}");
                                  print(
                                      "adult count list ${acController.adultDdnum}");
                                  print(
                                      "child count list${acController.childDdnum}");
                                  acController.newRoomCount.value =
                                      acController.roomCount.value;

                                  for (int i = 0;
                                      i <
                                          int.parse(acController
                                              .newRoomCount.value
                                              .toString());
                                      i++) {
                                    mappedAges = acController
                                        .ageTextControllers[i]
                                        .map((e) => int.parse(e.text))
                                        .toList();

                                    acController.allAgeOrgs.add(mappedAges!);
                                  }

                                  acController.accommodationDetails =
                                      getEnteredData(
                                    acController,
                                  );

                                  //===========================

                                  // for (int i = 0;
                                  //     i <
                                  //         acController
                                  //             .ageTextControllers!.length;
                                  //     i++) {
                                  //   for (int j = 0;
                                  //       j <
                                  //           acController
                                  //               .ageTextControllers![i]
                                  //               .length;
                                  //       j++) {
                                  //     childAgeList.add(acController
                                  //         .ageTextControllers[i][j].text);
                                  //     // print(
                                  //     //     "Room $i, Child $j: ${acController.ageTextControllers![i][j].text}");
                                  //   }

                                  // }
                                  // print(
                                  //     "this is child agelist${childAgeList.toString()}");
                                  acController.isSubLoading.value = false;
                                  Get.back();
                                }
                              },
                              child: Text(
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
      AccomodationController acController) {
    List<Map<String, dynamic>> dataList = [];

    var length = acController.newRoomCount.value != ""
        ? acController.newRoomCount.value
        : 1;

    for (int i = 0; i < int.parse(length.toString()); i++) {
      Map<String, dynamic> data = {
        "RoomSrNo": acController.newRoomCount.value != "" ? (i + 1) : 0,
        'NoOfAdult': acController.adultDdnum[i] != 0
            ? acController.adultDdnum[i]
            : 0.toString(),
        'NoOfChild': acController.childDdnum[i] == 0
            ? 0.toString()
            : acController.childDdnum[i] != 0
                ? acController.childDdnum[i]
                : 0.toString(),
        if (acController.allAgeOrgs[i].isNotEmpty)
          // "children age": acController.allAgeOrgs[i].join(', ')
          "ChildAges": acController.allAgeOrgs[i]
        else if (acController.allAgeOrgs[i].isEmpty)
          "ChildAges": []
      };

      dataList.add(data);
    }

    return dataList;
  }
}
