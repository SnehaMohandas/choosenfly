// To parse this JSON data, do
//
//     final destinationModel = destinationModelFromJson(jsonString);

import 'dart:convert';

List<DestinationModel> destinationModelFromJson(String str) =>
    List<DestinationModel>.from(
        json.decode(str).map((x) => DestinationModel.fromJson(x)));

String destinationModelToJson(List<DestinationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DestinationModel {
  int hotelId;
  int searchlogid;
  String hotelCode;
  dynamic hotelName;
  int hotelTypeId;
  dynamic noOfRooms;
  int avhotelid;
  int avroomid;
  int avalablerooms;
  dynamic avrangeFrom;
  int freehotelId;
  int freeroomid;
  int freerooms;
  dynamic freerangeFrom;
  int blockhotelId;
  int blockroomid;
  int blockrooms;
  dynamic blockrangeFrom;
  dynamic hotelType;
  dynamic hotelCategory;
  dynamic childChargeableAgeMax;
  dynamic childComAgeMax;
  String hotelDetails;
  dynamic imageName;
  dynamic markupType;
  dynamic markup;
  int hotelRoomCategoryId;
  int hotelRoomtypeId;
  int roomTypeId;
  dynamic roomCategory;
  dynamic roomType;
  dynamic roomdetails;
  int avHotelid;
  int avRoomCategoryId;
  dynamic rangeFrom;
  List<dynamic> searchHotelRoomsDtoList;
  dynamic currencyValue;

  DestinationModel({
    required this.hotelId,
    required this.searchlogid,
    required this.hotelCode,
    required this.hotelName,
    required this.hotelTypeId,
    required this.noOfRooms,
    required this.avhotelid,
    required this.avroomid,
    required this.avalablerooms,
    required this.avrangeFrom,
    required this.freehotelId,
    required this.freeroomid,
    required this.freerooms,
    required this.freerangeFrom,
    required this.blockhotelId,
    required this.blockroomid,
    required this.blockrooms,
    required this.blockrangeFrom,
    required this.hotelType,
    required this.hotelCategory,
    required this.childChargeableAgeMax,
    required this.childComAgeMax,
    required this.hotelDetails,
    required this.imageName,
    required this.markupType,
    required this.markup,
    required this.hotelRoomCategoryId,
    required this.hotelRoomtypeId,
    required this.roomTypeId,
    required this.roomCategory,
    required this.roomType,
    required this.roomdetails,
    required this.avHotelid,
    required this.avRoomCategoryId,
    required this.rangeFrom,
    required this.searchHotelRoomsDtoList,
    required this.currencyValue,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
        hotelId: json["hotel_id"],
        searchlogid: json["searchlogid"],
        hotelCode: json["hotel_code"],
        hotelName: json["hotel_name"],
        hotelTypeId: json["hotel_type_id"],
        noOfRooms: json["noOfRooms"],
        avhotelid: json["avhotelid"],
        avroomid: json["avroomid"],
        avalablerooms: json["avalablerooms"],
        avrangeFrom: json["avrangeFrom"],
        freehotelId: json["freehotel_id"],
        freeroomid: json["freeroomid"],
        freerooms: json["freerooms"],
        freerangeFrom: json["freerangeFrom"],
        blockhotelId: json["blockhotel_id"],
        blockroomid: json["blockroomid"],
        blockrooms: json["blockrooms"],
        blockrangeFrom: json["blockrangeFrom"],
        hotelType: json["hotelType"],

        //hotelType: hotelTypeValues.map[json["hotelType"]]!,
        hotelCategory: json["hotel_category"],
        childChargeableAgeMax: json["childChargeableAgeMax"],
        childComAgeMax: json["childComAgeMax"],
        hotelDetails: json["hotel_details"],
        imageName: json["imageName"],
        markupType: json["markupType"],
        markup: json["markup"],
        hotelRoomCategoryId: json["hotel_room_category_id"],
        hotelRoomtypeId: json["hotel_roomtype_id"],
        roomTypeId: json["roomType_id"],
        roomCategory: json["roomCategory"],
        roomType: json["roomType"],
        roomdetails: json["roomdetails"],
        avHotelid: json["av_hotelid"],
        avRoomCategoryId: json["av_room_category_id"],
        rangeFrom: json["rangeFrom"],
        searchHotelRoomsDtoList:
            List<dynamic>.from(json["searchHotelRoomsDTOList"].map((x) => x)),
        currencyValue: json["currency_value"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "searchlogid": searchlogid,
        "hotel_code": hotelCode,
        "hotel_name": hotelName,
        "hotel_type_id": hotelTypeId,
        "noOfRooms": noOfRooms,
        "avhotelid": avhotelid,
        "avroomid": avroomid,
        "avalablerooms": avalablerooms,
        "avrangeFrom": avrangeFrom,
        "freehotel_id": freehotelId,
        "freeroomid": freeroomid,
        "freerooms": freerooms,
        "freerangeFrom": freerangeFrom,
        "blockhotel_id": blockhotelId,
        "blockroomid": blockroomid,
        "blockrooms": blockrooms,
        "blockrangeFrom": blockrangeFrom,
        "hotelType": hotelTypeValues.reverse[hotelType],
        "hotel_category": hotelCategory,
        "childChargeableAgeMax": childChargeableAgeMax,
        "childComAgeMax": childComAgeMax,
        "hotel_details": hotelDetails,
        "imageName": imageName,
        "markupType": markupType,
        "markup": markup,
        "hotel_room_category_id": hotelRoomCategoryId,
        "hotel_roomtype_id": hotelRoomtypeId,
        "roomType_id": roomTypeId,
        "roomCategory": roomCategory,
        "roomType": roomType,
        "roomdetails": roomdetails,
        "av_hotelid": avHotelid,
        "av_room_category_id": avRoomCategoryId,
        "rangeFrom": rangeFrom,
        "searchHotelRoomsDTOList":
            List<dynamic>.from(searchHotelRoomsDtoList.map((x) => x)),
        "currency_value": currencyValue,
      };
}

enum HotelType { COUNTRY, STATE }

final hotelTypeValues =
    EnumValues({"Country": HotelType.COUNTRY, "State": HotelType.STATE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
