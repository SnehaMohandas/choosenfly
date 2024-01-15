import 'dart:convert';

import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookFormController extends GetxController {
  final platform;
  final checkIn;
  final checkOut;
  final hotelId;
  final totalPrice;

  final selectedRoomcategoryData;
  // final sellingPrice;
  // final roomCategoryId;
  // final roomTypeId;
  // final occupancyId;

  BookFormController({
    required this.platform,
    required this.checkIn,
    required this.checkOut,
    required this.hotelId,
    required this.totalPrice,
    required this.selectedRoomcategoryData,

    // required this.sellingPrice,
    // required this.totalPrice,
    // required this.roomCategoryId,
    // required this.roomTypeId,
    // required this.occupancyId
  });

  var leaddata;
  var guestFormdata;
  var parsedCheckin;
  var parsedCheckout;
  var roomController = Get.find<RoomController2>();
  var acController = Get.find<AccomodationController>();
  //  List<List<TextEditingController>> controllersList = [];
  var roomDetail;

  Future postAccommodation(
      checkinDate, checkoutDate, roomType, roomDetails) async {
    roomDetail = roomDetails;
    parsedCheckin = DateFormat('yyyy-MM-dd')
        .format(DateFormat('MMM-dd-yyyy').parse(checkinDate));
    parsedCheckout = DateFormat('yyyy-MM-dd')
        .format(DateFormat('MMM-dd-yyyy').parse(checkoutDate));
    // print(guestFormdata);
    ///both guest and lead data
    final Map<String, dynamic> requestData = {
      "CheckInDate": "${parsedCheckin}",
      "CheckOutDate": "${parsedCheckout}",
      "Roomtype": roomType.toString(),
      "HCode": "DXB9892146",
      "CityId": "1",
      "NationalityId": "1",
      "RoomDetail": roomDetails,
      "Lead": leaddata,
      "Guests": guestFormdata == null ? [] : guestFormdata
    };
    print("forms data list is here=====>>>${jsonEncode(requestData)}");
  }

//inhouse booking

  inhouseBooking() {
    print(selectedRoomcategoryData);
    var data = {
      "employee_id": "",
      "customerDTO": leaddata,
      "customBookingHotelDetailsDTO": [
        {
          "apitype": "${platform}",
          "checkIn": checkIn.toString(),
          "refund": "true",
          "remark": "",
          "specialremark": "",
          "checkOut": checkOut.toString(),
          "hotel_id": hotelId.toString(),
          "paymentStatus": "NOTPAID",
          "hotelbooking_id": "0",
          "sellingprice":
              selectedRoomcategoryData["totalRateWithMarkup"].toString(),
          "totalprice": selectedRoomcategoryData["totalRate"].toString(),
          "tourism_dirhams": "0",
          "customBookingHotelRoomCategoryList": [
            {
              "booking_room_id": "0",
              "room_category_id":
                  selectedRoomcategoryData["room_category_id"].toString(),
              "share_type_id": "0",
              "room_type_id":
                  selectedRoomcategoryData["room_type_id"].toString(),
              "occupancy_id":
                  selectedRoomcategoryData["filterHotelRoomsOccupancyDTOList"]
                          [0]["occupancy_id"]
                      .toString(),
              "price": "0",
              "no_of_adult":
                  selectedRoomcategoryData["filterHotelRoomsOccupancyDTOList"]
                          [0]["totalAdult"]
                      .toString(),
              "no_of_child":
                  selectedRoomcategoryData["filterHotelRoomsOccupancyDTOList"]
                          [0]["totalChild"]
                      .toString(),
              "no_of_rooms": roomDetail.length.toString(),
              "meal_plan_id": "0",
              "childAge_Array":
                  selectedRoomcategoryData["filterHotelRoomsOccupancyDTOList"]
                      [0]["givenChildAge"],
              "hotelCompulsoryBookingDTOs": [],
              "guestdetailsDTOArray": [],
              "roomBookingDayRatesDTOs": [
                {
                  "currDate": checkIn.toString(),
                  "costPrice": "1",
                  "sellingPrice":
                      selectedRoomcategoryData["totalRateWithMarkup"]
                          .toString(),
                  "roomRate": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["roomRate"]
                      .toString(),
                  "eventRate": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["eventRate"]
                      .toString(),
                  "adultExtraBedRate": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["adultExtraBedRate"]
                      .toString(),
                  "childExtraBedRate": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["childExtraBedRate"]
                      .toString(),
                  "roomRateWithMarkup": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["roomRateWithMarkup"]
                      .toString(),
                  "eventRateWithMarkup": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["eventRateWithMarkup"]
                      .toString(),
                  "rateCode": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["priceCode"]
                      .toString(),
                  "adultExtraBedRateWithMarkup": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["adultExtraBedRateWithMarkup"]
                      .toString(),
                  "childExtraBedRateWithMarkup": selectedRoomcategoryData[
                              "filterHotelRoomsOccupancyDTOList"][0]
                          ["eachDayRoomList"][0]["childExtraBedRateWithMarkup"]
                      .toString()
                }
              ],
              "room_type_code": null,
              "rate_plan_code": null
            }
          ],
          "hotelBookingDayRatesDTOs": [],
          "paymentapi_id": "",
        }
      ],
      "total_cost": 1,
      "paymentapi_id": ""
    };

    print("datatattata=====>>>>>${data}");
  }

  @override
  void onInit() {
    roomController.selectedcourtesy2.value = List.generate(
        roomController.guestTotal.value != 1 &&
                roomController.guestTotal.value != 0
            ? roomController.guestTotal.value - 1
            : roomController.guestTotal.value == 1
                ? 0
                : acController.orgguestTotal.value != 1 &&
                        acController.orgguestTotal.value != 0
                    ? acController.orgguestTotal.value - 1
                    : acController.guestTotal.value != 1 &&
                            acController.guestTotal.value != 0
                        ? acController.guestTotal.value - 1
                        : 0,
        (index) => "Mr.");
    roomController.selectedGender.value = List.generate(
        roomController.guestTotal.value != 1 &&
                roomController.guestTotal.value != 0
            ? roomController.guestTotal.value - 1
            : roomController.guestTotal.value == 1
                ? 0
                : acController.orgguestTotal.value != 1 &&
                        acController.orgguestTotal.value != 0
                    ? acController.orgguestTotal.value - 1
                    : acController.guestTotal.value != 1 &&
                            acController.guestTotal.value != 0
                        ? acController.guestTotal.value - 1
                        : 0,
        (index) => "");
    //inhouseBooking();
    super.onInit();
  }
}
