// To parse this JSON data, do
//
//     final allHotelModel = allHotelModelFromJson(jsonString);

import 'dart:convert';

List<AllHotelModel> allHotelModelFromJson(String str) =>
    List<AllHotelModel>.from(
        json.decode(str).map((x) => AllHotelModel.fromJson(x)));

String allHotelModelToJson(List<AllHotelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllHotelModel {
  Hotels? inhouseHotels;
  Hotels? atharvaHotels;
  Hotels? jumeirahHotels;
  Hotels? iwtxHotels;

  AllHotelModel({
    this.inhouseHotels,
    this.atharvaHotels,
    this.jumeirahHotels,
    this.iwtxHotels,
  });

  factory AllHotelModel.fromJson(Map<String, dynamic> json) => AllHotelModel(
        inhouseHotels: json["inhouse_hotels"] == null
            ? null
            : Hotels.fromJson(json["inhouse_hotels"]),
        atharvaHotels: json["atharva_hotels"] == null
            ? null
            : Hotels.fromJson(json["atharva_hotels"]),
        jumeirahHotels: json["jumeirah_hotels"] == null
            ? null
            : Hotels.fromJson(json["jumeirah_hotels"]),
        iwtxHotels: json["iwtx_hotels"] == null
            ? null
            : Hotels.fromJson(json["iwtx_hotels"]),
      );

  Map<String, dynamic> toJson() => {
        "inhouse_hotels": inhouseHotels?.toJson(),
        "atharva_hotels": atharvaHotels?.toJson(),
        "jumeirah_hotels": jumeirahHotels?.toJson(),
        "iwtx_hotels": iwtxHotels?.toJson(),
      };
}

class Hotels {
  String fileName;
  List<dynamic> data;
  // List<DatumClass> hotelList;

  Hotels({
    required this.fileName,
    required this.data,
    // required this.hotelList
  });

  factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
        fileName: json["file_name"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        // hotelList:
      );

  Map<String, dynamic> toJson() => {
        "file_name": fileName,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

class DatumClass {
  int hotelId;
  int agentId;
  String hotelCode;
  String hotelName;
  int hotelTypeId;
  int noOfnights;
  int nativeContry;
  HotelType? hotelType;
  String hotelCategory;
  String? childChargeableAgeMax;
  String? childComAgeMax;
  HotelDetails hotelDetails;
  String imageName;
  String? markupType;
  String? markup;
  String? currencyValue;
  double totalRateMax;
  double totalRateMin;
  String apiType;
  CancellationPenalty cancellationPenalty;
  PlatForm platForm;
  dynamic searchParams;
  dynamic serachCityOrCountryId;
  dynamic atharvaHotels;
  int cityId;
  dynamic roomNo;
  dynamic hotelSearchIwtxResponse;
  int atharvaCityId;
  dynamic atharvahCode;
  dynamic atharvaTokenId;
  dynamic atharvaStarRating;
  dynamic atharvaHotelImages;
  dynamic iwtxContractId;
  int iwtxRate;
  dynamic room;
  dynamic hiddenRooms;
  dynamic searchRoomDtOs;
  List<SearchHotelRoomsDtoList> searchHotelRoomsDtoList;
  dynamic atharvaHoteCodeSingleRoomResponse;
  dynamic atharvaHoteCodeMultipleRoomResponse;
  dynamic atharvaSingleRoomResponse;
  dynamic atharvamultipleRoomResponse;
  dynamic singleIwtxHotelSearchResponse;
  dynamic multiIwtxHotelSearchResponse;
  dynamic jumOwnHotelListDto;
  dynamic jumRoomDetails;
  dynamic jumeirahError;
  dynamic checkIn;
  dynamic checkOut;

  DatumClass({
    required this.hotelId,
    required this.agentId,
    required this.hotelCode,
    required this.hotelName,
    required this.hotelTypeId,
    required this.noOfnights,
    required this.nativeContry,
    required this.hotelType,
    required this.hotelCategory,
    required this.childChargeableAgeMax,
    required this.childComAgeMax,
    required this.hotelDetails,
    required this.imageName,
    required this.markupType,
    required this.markup,
    required this.currencyValue,
    required this.totalRateMax,
    required this.totalRateMin,
    required this.apiType,
    required this.cancellationPenalty,
    required this.platForm,
    required this.searchParams,
    required this.serachCityOrCountryId,
    required this.atharvaHotels,
    required this.cityId,
    required this.roomNo,
    required this.hotelSearchIwtxResponse,
    required this.atharvaCityId,
    required this.atharvahCode,
    required this.atharvaTokenId,
    required this.atharvaStarRating,
    required this.atharvaHotelImages,
    required this.iwtxContractId,
    required this.iwtxRate,
    required this.room,
    required this.hiddenRooms,
    required this.searchRoomDtOs,
    required this.searchHotelRoomsDtoList,
    required this.atharvaHoteCodeSingleRoomResponse,
    required this.atharvaHoteCodeMultipleRoomResponse,
    required this.atharvaSingleRoomResponse,
    required this.atharvamultipleRoomResponse,
    required this.singleIwtxHotelSearchResponse,
    required this.multiIwtxHotelSearchResponse,
    required this.jumOwnHotelListDto,
    required this.jumRoomDetails,
    required this.jumeirahError,
    required this.checkIn,
    required this.checkOut,
  });

  factory DatumClass.fromJson(Map<String, dynamic> json) => DatumClass(
        hotelId: json["hotel_id"],
        agentId: json["agent_id"],
        hotelCode: json["hotel_code"],
        hotelName: json["hotel_name"],
        hotelTypeId: json["hotel_type_id"],
        noOfnights: json["noOfnights"],
        nativeContry: json["nativeContry"],
        hotelType: hotelTypeValues.map[json["hotelType"]]!,
        hotelCategory: json["hotel_category"],
        childChargeableAgeMax: json["childChargeableAgeMax"],
        childComAgeMax: json["childComAgeMax"],
        hotelDetails: hotelDetailsValues.map[json["hotel_details"]]!,
        imageName: json["imageName"],
        markupType: json["markupType"],
        markup: json["markup"],
        currencyValue: json["currency_value"],
        totalRateMax: json["totalRateMax"]?.toDouble(),
        totalRateMin: json["totalRateMin"]?.toDouble(),
        apiType: json["apiType"],
        cancellationPenalty:
            cancellationPenaltyValues.map[json["cancellationPenalty"]]!,
        platForm: platFormValues.map[json["platForm"]]!,
        searchParams: json["searchParams"],
        serachCityOrCountryId: json["serachCityOrCountryId"],
        atharvaHotels: json["atharvaHotels"],
        cityId: json["cityId"],
        roomNo: json["roomNo"],
        hotelSearchIwtxResponse: json["hotelSearchIWTXResponse"],
        atharvaCityId: json["atharvaCityId"],
        atharvahCode: json["atharvahCode"],
        atharvaTokenId: json["atharvaTokenId"],
        atharvaStarRating: json["atharva_star_rating"],
        atharvaHotelImages: json["atharva_hotel_images"],
        iwtxContractId: json["iwtxContractId"],
        iwtxRate: json["iwtxRate"],
        room: json["room"],
        hiddenRooms: json["hiddenRooms"],
        searchRoomDtOs: json["searchRoomDTOs"],
        searchHotelRoomsDtoList: List<SearchHotelRoomsDtoList>.from(
            json["searchHotelRoomsDTOList"]
                .map((x) => SearchHotelRoomsDtoList.fromJson(x))),
        atharvaHoteCodeSingleRoomResponse:
            json["atharvaHoteCodeSingleRoomResponse"],
        atharvaHoteCodeMultipleRoomResponse:
            json["atharvaHoteCodeMultipleRoomResponse"],
        atharvaSingleRoomResponse: json["atharvaSingleRoomResponse"],
        atharvamultipleRoomResponse: json["atharvamultipleRoomResponse"],
        singleIwtxHotelSearchResponse: json["singleIwtxHotelSearchResponse"],
        multiIwtxHotelSearchResponse: json["multiIwtxHotelSearchResponse"],
        jumOwnHotelListDto: json["jumOwnHotelListDTO"],
        jumRoomDetails: json["jumRoomDetails"],
        jumeirahError: json["jumeirahError"],
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "agent_id": agentId,
        "hotel_code": hotelCode,
        "hotel_name": hotelName,
        "hotel_type_id": hotelTypeId,
        "noOfnights": noOfnights,
        "nativeContry": nativeContry,
        "hotelType": hotelTypeValues.reverse[hotelType],
        "hotel_category": hotelCategory,
        "childChargeableAgeMax": childChargeableAgeMax,
        "childComAgeMax": childComAgeMax,
        "hotel_details": hotelDetailsValues.reverse[hotelDetails],
        "imageName": imageName,
        "markupType": markupType,
        "markup": markup,
        "currency_value": currencyValue,
        "totalRateMax": totalRateMax,
        "totalRateMin": totalRateMin,
        "apiType": apiType,
        "cancellationPenalty":
            cancellationPenaltyValues.reverse[cancellationPenalty],
        "platForm": platFormValues.reverse[platForm],
        "searchParams": searchParams,
        "serachCityOrCountryId": serachCityOrCountryId,
        "atharvaHotels": atharvaHotels,
        "cityId": cityId,
        "roomNo": roomNo,
        "hotelSearchIWTXResponse": hotelSearchIwtxResponse,
        "atharvaCityId": atharvaCityId,
        "atharvahCode": atharvahCode,
        "atharvaTokenId": atharvaTokenId,
        "atharva_star_rating": atharvaStarRating,
        "atharva_hotel_images": atharvaHotelImages,
        "iwtxContractId": iwtxContractId,
        "iwtxRate": iwtxRate,
        "room": room,
        "hiddenRooms": hiddenRooms,
        "searchRoomDTOs": searchRoomDtOs,
        "searchHotelRoomsDTOList":
            List<dynamic>.from(searchHotelRoomsDtoList.map((x) => x.toJson())),
        "atharvaHoteCodeSingleRoomResponse": atharvaHoteCodeSingleRoomResponse,
        "atharvaHoteCodeMultipleRoomResponse":
            atharvaHoteCodeMultipleRoomResponse,
        "atharvaSingleRoomResponse": atharvaSingleRoomResponse,
        "atharvamultipleRoomResponse": atharvamultipleRoomResponse,
        "singleIwtxHotelSearchResponse": singleIwtxHotelSearchResponse,
        "multiIwtxHotelSearchResponse": multiIwtxHotelSearchResponse,
        "jumOwnHotelListDTO": jumOwnHotelListDto,
        "jumRoomDetails": jumRoomDetails,
        "jumeirahError": jumeirahError,
        "checkIn": checkIn,
        "checkOut": checkOut,
      };
}

enum CancellationPenalty { N, Y }

final cancellationPenaltyValues =
    EnumValues({"N": CancellationPenalty.N, "Y": CancellationPenalty.Y});

enum HotelDetails {
  DUBAI_UNITED_ARAB_EMIRATES,
  JUMEIRAH_BEACH_UNITED_ARAB_EMIRATES,
  UNITED_ARAB_EMIRATES_DUBAI
}

final hotelDetailsValues = EnumValues({
  "Dubai , United Arab Emirates": HotelDetails.DUBAI_UNITED_ARAB_EMIRATES,
  "Jumeirah Beach , United Arab Emirates":
      HotelDetails.JUMEIRAH_BEACH_UNITED_ARAB_EMIRATES,
  "United Arab Emirates, Dubai": HotelDetails.UNITED_ARAB_EMIRATES_DUBAI
});

enum HotelType { APARTMENTS, HOTEL, RESORT }

final hotelTypeValues = EnumValues({
  "Apartments": HotelType.APARTMENTS,
  "Hotel": HotelType.HOTEL,
  "Resort": HotelType.RESORT
});

enum PlatForm { ATHARVA, INHOUSE }

final platFormValues =
    EnumValues({"atharva": PlatForm.ATHARVA, "inhouse": PlatForm.INHOUSE});

class SearchHotelRoomsDtoList {
  int hotelRoomCategoryId;
  int hotelRoomtypeId;
  int roomCategoryId;
  int roomTypeId;
  int hotelId;
  String roomdetails;
  int minimumDays;
  int availableroom;
  String roomCategory;
  RoomType roomType;
  EType rateType;
  dynamic remark;
  String types;
  CancellationPenalty refundStatus;
  int totalRate;
  double totalRateWithMarkup;
  String intoken;
  CancellationPenalty cancellationPenalty;
  dynamic jumNoOfUnitsAvailable;
  dynamic jumMaxOccupancy;
  List<FilterHotelRoomsOccupancyDtoList> filterHotelRoomsOccupancyDtoList;
  dynamic cancellationPolicy;
  dynamic guaranteePolicy;
  dynamic breakfastIncluded;
  dynamic lunchIncluded;
  dynamic dinnerIncluded;
  int mealPlanCode;
  dynamic planFeatures;
  dynamic deadlineDate;

  SearchHotelRoomsDtoList({
    required this.hotelRoomCategoryId,
    required this.hotelRoomtypeId,
    required this.roomCategoryId,
    required this.roomTypeId,
    required this.hotelId,
    required this.roomdetails,
    required this.minimumDays,
    required this.availableroom,
    required this.roomCategory,
    required this.roomType,
    required this.rateType,
    required this.remark,
    required this.types,
    required this.refundStatus,
    required this.totalRate,
    required this.totalRateWithMarkup,
    required this.intoken,
    required this.cancellationPenalty,
    required this.jumNoOfUnitsAvailable,
    required this.jumMaxOccupancy,
    required this.filterHotelRoomsOccupancyDtoList,
    required this.cancellationPolicy,
    required this.guaranteePolicy,
    required this.breakfastIncluded,
    required this.lunchIncluded,
    required this.dinnerIncluded,
    required this.mealPlanCode,
    required this.planFeatures,
    required this.deadlineDate,
  });

  factory SearchHotelRoomsDtoList.fromJson(Map<String, dynamic> json) =>
      SearchHotelRoomsDtoList(
        hotelRoomCategoryId: json["hotel_room_category_id"],
        hotelRoomtypeId: json["hotel_roomtype_id"],
        roomCategoryId: json["room_category_id"],
        roomTypeId: json["room_type_id"],
        hotelId: json["hotel_id"],
        roomdetails: json["roomdetails"],
        minimumDays: json["minimumDays"],
        availableroom: json["availableroom"],
        roomCategory: json["roomCategory"],
        roomType: roomTypeValues.map[json["roomType"]]!,
        rateType: eTypeValues.map[json["rateType"]]!,
        remark: json["remark"],
        types: json["types"],
        refundStatus: cancellationPenaltyValues.map[json["refundStatus"]]!,
        totalRate: json["totalRate"],
        totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
        intoken: json["intoken"],
        cancellationPenalty:
            cancellationPenaltyValues.map[json["cancellationPenalty"]]!,
        jumNoOfUnitsAvailable: json["jumNoOfUnitsAvailable"],
        jumMaxOccupancy: json["jum_Max_Occupancy"],
        filterHotelRoomsOccupancyDtoList:
            List<FilterHotelRoomsOccupancyDtoList>.from(
                json["filterHotelRoomsOccupancyDTOList"]
                    .map((x) => FilterHotelRoomsOccupancyDtoList.fromJson(x))),
        cancellationPolicy: json["cancellation_policy"],
        guaranteePolicy: json["guarantee_policy"],
        breakfastIncluded: json["breakfast_included"],
        lunchIncluded: json["lunch_included"],
        dinnerIncluded: json["dinner_included"],
        mealPlanCode: json["meal_plan_code"],
        planFeatures: json["plan_features"],
        deadlineDate: json["deadlineDate"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_room_category_id": hotelRoomCategoryId,
        "hotel_roomtype_id": hotelRoomtypeId,
        "room_category_id": roomCategoryId,
        "room_type_id": roomTypeId,
        "hotel_id": hotelId,
        "roomdetails": roomdetails,
        "minimumDays": minimumDays,
        "availableroom": availableroom,
        "roomCategory": roomCategory,
        "roomType": roomTypeValues.reverse[roomType],
        "rateType": eTypeValues.reverse[rateType],
        "remark": remark,
        "types": types,
        "refundStatus": cancellationPenaltyValues.reverse[refundStatus],
        "totalRate": totalRate,
        "totalRateWithMarkup": totalRateWithMarkup,
        "intoken": intoken,
        "cancellationPenalty":
            cancellationPenaltyValues.reverse[cancellationPenalty],
        "jumNoOfUnitsAvailable": jumNoOfUnitsAvailable,
        "jum_Max_Occupancy": jumMaxOccupancy,
        "filterHotelRoomsOccupancyDTOList": List<dynamic>.from(
            filterHotelRoomsOccupancyDtoList.map((x) => x.toJson())),
        "cancellation_policy": cancellationPolicy,
        "guarantee_policy": guaranteePolicy,
        "breakfast_included": breakfastIncluded,
        "lunch_included": lunchIncluded,
        "dinner_included": dinnerIncluded,
        "meal_plan_code": mealPlanCode,
        "plan_features": planFeatures,
        "deadlineDate": deadlineDate,
      };
}

class FilterHotelRoomsOccupancyDtoList {
  int occupancyId;
  OccupancyType occupancyType;
  int adultextrabed;
  int childextrabed;
  int totalAdult;
  int totalChild;
  int givenAdult;
  int givenChild;
  List<dynamic> givenChildAge;
  int roomCategoryId;
  int totalRate;
  double totalRateWithMarkup;
  List<EachDayRoomList> eachDayRoomList;

  FilterHotelRoomsOccupancyDtoList({
    required this.occupancyId,
    required this.occupancyType,
    required this.adultextrabed,
    required this.childextrabed,
    required this.totalAdult,
    required this.totalChild,
    required this.givenAdult,
    required this.givenChild,
    required this.givenChildAge,
    required this.roomCategoryId,
    required this.totalRate,
    required this.totalRateWithMarkup,
    required this.eachDayRoomList,
  });

  factory FilterHotelRoomsOccupancyDtoList.fromJson(
          Map<String, dynamic> json) =>
      FilterHotelRoomsOccupancyDtoList(
        occupancyId: json["occupancy_id"],
        occupancyType: occupancyTypeValues.map[json["occupancy_Type"]]!,
        adultextrabed: json["adultextrabed"],
        childextrabed: json["childextrabed"],
        totalAdult: json["totalAdult"],
        totalChild: json["totalChild"],
        givenAdult: json["givenAdult"],
        givenChild: json["givenChild"],
        givenChildAge: List<dynamic>.from(json["givenChildAge"].map((x) => x)),
        roomCategoryId: json["room_category_id"],
        totalRate: json["totalRate"],
        totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
        eachDayRoomList: List<EachDayRoomList>.from(
            json["eachDayRoomList"].map((x) => EachDayRoomList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "occupancy_id": occupancyId,
        "occupancy_Type": occupancyTypeValues.reverse[occupancyType],
        "adultextrabed": adultextrabed,
        "childextrabed": childextrabed,
        "totalAdult": totalAdult,
        "totalChild": totalChild,
        "givenAdult": givenAdult,
        "givenChild": givenChild,
        "givenChildAge": List<dynamic>.from(givenChildAge.map((x) => x)),
        "room_category_id": roomCategoryId,
        "totalRate": totalRate,
        "totalRateWithMarkup": totalRateWithMarkup,
        "eachDayRoomList":
            List<dynamic>.from(eachDayRoomList.map((x) => x.toJson())),
      };
}

class EachDayRoomList {
  CurrDate currDate;
  EType priceType;
  int rateId;
  PriceCode priceCode;
  Days days;
  int roomRate;
  int eventRate;
  int totalRate;
  double totalRateWithMarkup;
  int adultExtraBedRate;
  int childExtraBedRate;
  double roomRateWithMarkup;
  int eventRateWithMarkup;
  int adultExtraBedRateWithMarkup;
  int childExtraBedRateWithMarkup;
  List<EventElement> events;
  bool refund;

  EachDayRoomList({
    required this.currDate,
    required this.priceType,
    required this.rateId,
    required this.priceCode,
    required this.days,
    required this.roomRate,
    required this.eventRate,
    required this.totalRate,
    required this.totalRateWithMarkup,
    required this.adultExtraBedRate,
    required this.childExtraBedRate,
    required this.roomRateWithMarkup,
    required this.eventRateWithMarkup,
    required this.adultExtraBedRateWithMarkup,
    required this.childExtraBedRateWithMarkup,
    required this.events,
    required this.refund,
  });

  factory EachDayRoomList.fromJson(Map<String, dynamic> json) =>
      EachDayRoomList(
        currDate: currDateValues.map[json["currDate"]]!,
        priceType: eTypeValues.map[json["priceType"]]!,
        rateId: json["rateId"],
        priceCode: priceCodeValues.map[json["priceCode"]]!,
        days: daysValues.map[json["days"]]!,
        roomRate: json["roomRate"],
        eventRate: json["eventRate"],
        totalRate: json["totalRate"],
        totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
        adultExtraBedRate: json["adultExtraBedRate"],
        childExtraBedRate: json["childExtraBedRate"],
        roomRateWithMarkup: json["roomRateWithMarkup"]?.toDouble(),
        eventRateWithMarkup: json["eventRateWithMarkup"],
        adultExtraBedRateWithMarkup: json["adultExtraBedRateWithMarkup"],
        childExtraBedRateWithMarkup: json["childExtraBedRateWithMarkup"],
        events: List<EventElement>.from(
            json["events"].map((x) => EventElement.fromJson(x))),
        refund: json["refund"],
      );

  Map<String, dynamic> toJson() => {
        "currDate": currDateValues.reverse[currDate],
        "priceType": eTypeValues.reverse[priceType],
        "rateId": rateId,
        "priceCode": priceCodeValues.reverse[priceCode],
        "days": daysValues.reverse[days],
        "roomRate": roomRate,
        "eventRate": eventRate,
        "totalRate": totalRate,
        "totalRateWithMarkup": totalRateWithMarkup,
        "adultExtraBedRate": adultExtraBedRate,
        "childExtraBedRate": childExtraBedRate,
        "roomRateWithMarkup": roomRateWithMarkup,
        "eventRateWithMarkup": eventRateWithMarkup,
        "adultExtraBedRateWithMarkup": adultExtraBedRateWithMarkup,
        "childExtraBedRateWithMarkup": childExtraBedRateWithMarkup,
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "refund": refund,
      };
}

enum CurrDate { THE_30122023 }

final currDateValues = EnumValues({"30/12/2023": CurrDate.THE_30122023});

enum Days { SATURDAY }

final daysValues = EnumValues({"Saturday": Days.SATURDAY});

class EventElement {
  EventEnum event;
  int eventId;
  int eventRate;
  int adultRate;
  int childRate;

  EventElement({
    required this.event,
    required this.eventId,
    required this.eventRate,
    required this.adultRate,
    required this.childRate,
  });

  factory EventElement.fromJson(Map<String, dynamic> json) => EventElement(
        event: eventEnumValues.map[json["event"]]!,
        eventId: json["eventId"],
        eventRate: json["eventRate"],
        adultRate: json["adultRate"],
        childRate: json["childRate"],
      );

  Map<String, dynamic> toJson() => {
        "event": eventEnumValues.reverse[event],
        "eventId": eventId,
        "eventRate": eventRate,
        "adultRate": adultRate,
        "childRate": childRate,
      };
}

enum EventEnum {
  CHRISTMAS_NEW_YEAR,
  EVENT_CHRISTMAS_NEW_YEAR,
  EVENT_NEW_YEAR,
  NEW_YEAR
}

final eventEnumValues = EnumValues({
  "Christmas - New Year": EventEnum.CHRISTMAS_NEW_YEAR,
  "Christmas-New Year": EventEnum.EVENT_CHRISTMAS_NEW_YEAR,
  "New Year ": EventEnum.EVENT_NEW_YEAR,
  "New Year": EventEnum.NEW_YEAR
});

enum PriceCode {
  CONTRACT,
  FIT,
  FIT_NYE,
  FIT_PEAK,
  FIT_WINTER,
  FIT_WINTER2,
  FSBB0,
  NEW_YEAR,
  PEAK,
  THE_11023311223,
  THE_231223030124
}

final priceCodeValues = EnumValues({
  "CONTRACT": PriceCode.CONTRACT,
  "FIT": PriceCode.FIT,
  "FIT NYE": PriceCode.FIT_NYE,
  "FIT PEAK": PriceCode.FIT_PEAK,
  "FIT WINTER": PriceCode.FIT_WINTER,
  "FIT WINTER2": PriceCode.FIT_WINTER2,
  "FSBB0": PriceCode.FSBB0,
  "NEW YEAR": PriceCode.NEW_YEAR,
  "PEAK": PriceCode.PEAK,
  "1/10/23-31/12/23": PriceCode.THE_11023311223,
  "23/12/23-03/01/24": PriceCode.THE_231223030124
});

enum EType { CONTRACT, SPECIAL }

final eTypeValues =
    EnumValues({"contract": EType.CONTRACT, "special": EType.SPECIAL});

enum OccupancyType { QUAD, SEXT, SINGLE, TRIPLE }

final occupancyTypeValues = EnumValues({
  "Quad": OccupancyType.QUAD,
  "Sext": OccupancyType.SEXT,
  "Single": OccupancyType.SINGLE,
  "Triple": OccupancyType.TRIPLE
});

enum RoomType { ROOM_ONLY, ROOM_WITH_BREAK_FAST, ROOM_WITH_HALF_BOARD }

final roomTypeValues = EnumValues({
  "Room Only": RoomType.ROOM_ONLY,
  "Room with BreakFast": RoomType.ROOM_WITH_BREAK_FAST,
  "Room with HalfBoard": RoomType.ROOM_WITH_HALF_BOARD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
