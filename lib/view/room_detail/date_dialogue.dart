import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

dateDialogue(BuildContext context, RoomController2 roomController,
    AccomodationController acController) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Check in: ",
                  style: TextStyle(color: ColorConstant.black, fontSize: 14)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              GestureDetector(
                onTap: () async {
                  roomController.selectCheckin(context, acController);
                },
                child: Container(
                  width: 140,
                  height: 35,
                  decoration: BoxDecoration(
                    color: ColorConstant.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(1, -1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Obx(() => roomController.checkInDate.value != ''
                            ? Text(
                                roomController.checkInDate.value.toString(),
                                style: const TextStyle(
                                    color: ColorConstant.liteBlack,
                                    fontSize: 12),
                              )
                            : const Text(
                                "-select-",
                                style: TextStyle(
                                    color: ColorConstant.liteBlack,
                                    fontSize: 12),
                              )),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 4,
                              offset: const Offset(2, 8),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => roomController.ischeckInError.value == true
                    ? const Text("please select checkin date",
                        style:
                            TextStyle(color: ColorConstant.red, fontSize: 10))
                    : const SizedBox(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text("Check out: ",
                  style: TextStyle(color: ColorConstant.black, fontSize: 14)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              GestureDetector(
                onTap: () async {
                  roomController.selectCheckout(context, acController);
                },
                child: Container(
                  width: 140,
                  height: 35,
                  decoration: BoxDecoration(
                    color: ColorConstant.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(1, -1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Obx(() => roomController.checkOutDate.value != ""
                            ? Text(
                                roomController.checkOutDate.value.toString(),
                                style: const TextStyle(
                                    color: ColorConstant.liteBlack,
                                    fontSize: 12),
                              )
                            : const Text(
                                "-select-",
                                style: TextStyle(
                                    color: ColorConstant.liteBlack,
                                    fontSize: 12),
                              )),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 4,
                              offset: const Offset(2, 8),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => roomController.ischeckOutError.value == true
                    ? const Text("please select checkout date",
                        style:
                            TextStyle(color: ColorConstant.red, fontSize: 10))
                    : const SizedBox(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text("Nights:",
                  style: TextStyle(color: ColorConstant.black, fontSize: 14)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Form(
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ],
                    onChanged: (value) {
                      print("textflddvall===>${value}");
                      int nights = int.tryParse(value) ?? 0;
                      roomController.updateCheckoutDate(nights, acController);
                    },
                    controller: roomController.nitController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14))),
                  ),
                ),
              ),
              Obx(
                () => roomController.isnightError.value == true
                    ? const Text("Atleast select 1 night",
                        style:
                            TextStyle(color: ColorConstant.red, fontSize: 10))
                    : const SizedBox(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(ColorConstant.white)),
                      onPressed: () {
                        // acController.checkInDate.value = "";
                        // acController.checkOutDate.value = "";
                        // acController.difference.value =
                        //     Duration(seconds: 0);
                        // acController.nitController.clear();
                        // acController.ischeckInError.value =
                        //     false;
                        // acController.ischeckOutError.value =
                        //     false;
                        // acController.isDateShown.value =
                        //     false;

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Close",
                        style: TextStyle(
                            color: ColorConstant.primaryColor, fontSize: 14),
                      )),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              ColorConstant.primaryColor)),
                      onPressed: () async {
                        if (roomController.checkInDate.value == "") {
                          roomController.ischeckInError.value = true;
                        } else if (roomController.checkOutDate.value == "") {
                          roomController.ischeckOutError.value = true;
                        } else if (roomController.nitController.text == "0" ||
                            roomController.nitController.text == "") {
                          roomController.isnightError.value = true;
                        } else {
                          Navigator.pop(context);

                          print("worked");
                          roomController.newCheckinDate.value =
                              roomController.checkInDate.value;
                          roomController.newCheckoutDate.value =
                              roomController.checkOutDate.value;
                          roomController.isnightError.value = false;
                          roomController.isDateShown.value = true;
                          // roomController.atharvaCancelPolicy();
                          // roomController.iwtxCancelPolicy();

                          await roomController.fetchRoomTypeidEdited();
                          // if (roomController.platform == "0" ||
                          //     roomController.platform == "10" &&
                          //         roomController.isNoRoomAvailable.value ==
                          //             false) {
                          //   roomController.inhouseJumerahCancelPolicy();
                          // } else if (roomController.platform == "12" &&
                          //     roomController.isNoRoomAvailable.value == false) {
                          //   roomController.iwtxCancelPolicy();
                          // } else if (roomController.platform == "11" &&
                          //     roomController.isNoRoomAvailable.value == false) {
                          //   roomController.atharvaCancelPolicy();
                          // }
                        }
                      },
                      child: const Text(
                        "Submit",
                        style:
                            TextStyle(color: ColorConstant.white, fontSize: 14),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
