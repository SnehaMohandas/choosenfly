import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_inn_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GuestEdit extends StatelessWidget {
  GuestEdit({super.key, required this.bookingInnController});
  final BookingInnController bookingInnController;
  var rooms = [1, 2, 3, 4];
  var adults = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  var children = [0, 1, 2, 3, 4, 5];
  final List ageController = [TextEditingController()];
  var childAgeList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List? mappedAges;

  @override
  Widget build(BuildContext context) {
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
              Icons.arrow_back,
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
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
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
                    value: bookingInnController.roomCount.value == ""
                        ? null
                        : bookingInnController.roomCount.value,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                      bookingInnController.selectedDdindex.clear();

                      bookingInnController.selectedChildIndex.value = "";
                      bookingInnController.selectedDdindex = [];
                      bookingInnController.childDdnum.value = [];
                      bookingInnController.adultDdnum.value = [];
                      bookingInnController.ageTextControllers = [];

                      bookingInnController.roomCount.value =
                          newValue.toString();
                      print(bookingInnController.roomCount.value);
                      for (int i = 0;
                          i <
                              int.parse(bookingInnController.roomCount.value
                                  .toString());
                          i++) {
                        bookingInnController.selectedDdindex.add("false");
                        bookingInnController.childDdnum.value.add(0);
                        bookingInnController.adultDdnum.value.add(0);
                        bookingInnController.ageTextControllers.add([]);
                      }
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
                      itemCount: bookingInnController.roomCount.value != ""
                          ? int.parse(bookingInnController.roomCount.value)
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          child: Text(
                                            "Adults",
                                            style: TextStyle(
                                              color: ColorConstant.black,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        DropdownButtonFormField<String>(
                                            value: bookingInnController
                                                            .adultDdnum
                                                            .value
                                                            .length ==
                                                        0 ||
                                                    bookingInnController
                                                            .adultDdnum
                                                            .value[index] ==
                                                        0
                                                ? null
                                                : bookingInnController
                                                    .adultDdnum.value[index],
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
                                                        borderSide: BorderSide(
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
                                                        BorderRadius.circular(
                                                            10))),
                                            items: adults.map((item) {
                                              return DropdownMenuItem<String>(
                                                value: item.toString(),
                                                child: Text(item.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              bookingInnController
                                                  .adultDdnum[index] = newValue;
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
                                        () => DropdownButtonFormField<String>(
                                            value: bookingInnController
                                                            .childDdnum
                                                            .value
                                                            .length ==
                                                        0 ||
                                                    bookingInnController
                                                            .childDdnum
                                                            .value[index] ==
                                                        0
                                                ? null
                                                : bookingInnController
                                                    .childDdnum.value[index],
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
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
                                                        BorderRadius.circular(
                                                            10))),
                                            items: children.map((item) {
                                              return DropdownMenuItem<String>(
                                                value: item.toString(),
                                                child: Text(item.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              bookingInnController
                                                  .selectedChildIndex
                                                  .value = index.toString();

                                              bookingInnController
                                                      .selectedDdindex[index] =
                                                  "true";

                                              bookingInnController
                                                  .childDdnum[index] = newValue;

                                              print(bookingInnController
                                                  .ageTextControllers);
                                              print(bookingInnController
                                                  .childDdnum[index]);
                                              print(index);
                                              print(bookingInnController
                                                  .ageTextControllers);

                                              //"""""""""""''''"

                                              bookingInnController
                                                  .ageTextControllers[index]
                                                  .clear();
                                              bookingInnController
                                                          .ageTextControllers[
                                                      index] =
                                                  List.generate(
                                                      int.parse(
                                                          bookingInnController
                                                              .childDdnum[index]
                                                              .toString()),
                                                      (index) =>
                                                          TextEditingController());

                                              print(
                                                  "allllll=>>>${bookingInnController.ageTextControllers}");
                                              print(
                                                  "specificcccc===>${bookingInnController.ageTextControllers[index]}");
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            //children's age

                            Obx(() => bookingInnController
                                            .selectedChildIndex.value ==
                                        index.toString() ||
                                    bookingInnController
                                            .selectedDdindex[index] ==
                                        "true"
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 4),
                                        child: Obx(
                                          () => bookingInnController.childDdnum
                                                      .value[index] ==
                                                  "0"
                                              ? SizedBox()
                                              : Text(
                                                  "Children's Age",
                                                  style: TextStyle(
                                                    color: ColorConstant.black,
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
                                                      bookingInnController
                                                                  .isValidate
                                                                  .value ==
                                                              true
                                                          ? 70
                                                          : 50),
                                          itemCount: int.parse(
                                              bookingInnController
                                                  .childDdnum[index]
                                                  .toString()),
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          itemBuilder: (context, childIndex) {
                                            return Padding(
                                              padding: EdgeInsets.all(0),
                                              child: SizedBox(
                                                //  height: 50,
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp("[0-9]")),
                                                  ],
                                                  controller: bookingInnController
                                                          .ageTextControllers[
                                                      index][childIndex],
                                                  decoration: InputDecoration(
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
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: ColorConstant
                                                              .lightBlue2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value == "") {
                                                      bookingInnController
                                                          .isValidate
                                                          .value = true;
                                                      return "Please enter age";
                                                    } else if (int.parse(
                                                                value) >
                                                            10 ||
                                                        int.parse(value) < 1) {
                                                      bookingInnController
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
                              padding: const EdgeInsets.symmetric(vertical: 15),
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
                            if (bookingInnController.isSubLoading.value ==
                                true) {
                              print("object");
                              bookingInnController.roomCount.value = "";
                              bookingInnController.selectedDdindex.clear();

                              bookingInnController.selectedChildIndex.value =
                                  "";
                              bookingInnController.selectedDdindex = [];
                              bookingInnController.childDdnum.value = [];
                              bookingInnController.adultDdnum.value = [];
                              bookingInnController.ageTextControllers = [];
                            }
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
                              bookingInnController.isSubLoading.value = true;

                              //childAgeList.clear();
                              bookingInnController.allAgeOrgs.clear();
                              print(bookingInnController.adultDdnum);
                              num adultSum = bookingInnController.adultDdnum
                                  .fold(0, (previous, current) {
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
                              num childSum = bookingInnController.childDdnum
                                  .fold(0, (previous, current) {
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
                              bookingInnController.guestTotal.value =
                                  adultSum.toInt() + childSum.toInt();
                              print(
                                  "sum of guests ${bookingInnController.guestTotal}");
                              print(
                                  "room count${bookingInnController.roomCount.value}");
                              print(
                                  "adult count list ${bookingInnController.adultDdnum}");
                              print(
                                  "child count list${bookingInnController.childDdnum}");

                              for (int i = 0;
                                  i <
                                      int.parse(bookingInnController
                                          .roomCount.value
                                          .toString());
                                  i++) {
                                mappedAges = bookingInnController
                                    .ageTextControllers[i]
                                    .map((e) => e.text)
                                    .toList();

                                bookingInnController.allAgeOrgs
                                    .add(mappedAges!);
                              }

                              var childorglist = getEnteredData(
                                bookingInnController,
                              );
                              print(childorglist);
                              //===========================

                              // for (int i = 0;
                              //     i <
                              //         bookingInnController
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
                              bookingInnController.isSubLoading.value = false;
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
  }

  List<Map<String, dynamic>> getEnteredData(
      BookingInnController bookingInnController) {
    List<Map<String, dynamic>> dataList = [];

    var length = bookingInnController.roomCount.value != ""
        ? bookingInnController.roomCount.value
        : 1;

    for (int i = 0; i < int.parse(length.toString()); i++) {
      Map<String, dynamic> data = {
        "room no": bookingInnController.roomCount.value != ""
            ? (i + 1).toString()
            : 0.toString(),
        'adult': bookingInnController.adultDdnum[i] != 0
            ? bookingInnController.adultDdnum[i]
            : 0.toString(),
        'children': bookingInnController.childDdnum[i] == 0
            ? 0.toString()
            : bookingInnController.childDdnum[i] != 0
                ? bookingInnController.childDdnum[i]
                : 0.toString(),
        if (bookingInnController.allAgeOrgs[i].isNotEmpty)
          "children age": bookingInnController.allAgeOrgs[i].join(', ')
      };

      dataList.add(data);
    }

    return dataList;
  }
}
