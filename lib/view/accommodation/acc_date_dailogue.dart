import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

acDateDialogue(BuildContext context, AccomodationController acController) {
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
                  acController.selectCheckin(context);
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
                        child: Obx(
                          () => acController.checkInDate.value == ""
                              ? const Text(
                                  "-select-",
                                  style: TextStyle(
                                      color: ColorConstant.liteBlack,
                                      fontSize: 12),
                                )
                              : Text(
                                  acController.checkInDate.value.toString(),
                                  style: const TextStyle(
                                      color: ColorConstant.liteBlack,
                                      fontSize: 12),
                                ),
                        ),
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
                () => acController.ischeckInError.value == true
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
                  acController.selectCheckout(context);
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
                        child: Obx(
                          () => acController.checkOutDate.value == ""
                              ? const Text(
                                  "-select-",
                                  style: TextStyle(
                                      color: ColorConstant.liteBlack,
                                      fontSize: 12),
                                )
                              : Text(
                                  acController.checkOutDate.value.toString(),
                                  style: const TextStyle(
                                      color: ColorConstant.liteBlack,
                                      fontSize: 12),
                                ),
                        ),
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
                () => acController.ischeckOutError.value == true
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
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Form(
                  child: TextFormField(
                    onChanged: (value) {
                      print("textflddvall===>${value}");
                      int nights = int.tryParse(value) ?? 0;
                      acController.updateCheckoutDate(nights);
                    },
                    controller: acController.nitController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ],
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
                () => acController.isnightError.value == true
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
                      onPressed: () {
                        if (acController.checkInDate.value == "") {
                          acController.ischeckInError.value = true;
                        } else if (acController.checkOutDate.value == "") {
                          acController.ischeckOutError.value = true;
                        } else if (acController.nitController.text == "0" ||
                            acController.nitController.text == "") {
                          acController.isnightError.value = true;
                        } else {
                          acController.newCheckinDate.value =
                              acController.checkInDate.value;
                          acController.newCheckoutDate.value =
                              acController.checkOutDate.value;
                          acController.isnightError.value = false;
                          acController.isDateShown.value = true;

                          Navigator.pop(context);
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
