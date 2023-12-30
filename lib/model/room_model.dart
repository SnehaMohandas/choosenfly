// import 'dart:convert';

// List<RoomModel> roomModelFromJson(String str) =>
//     List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromJson(x)));

// String roomModelToJson(List<RoomModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class RoomModel {
//   var hotelId;
//   var agentId;
//   String hotelCode;
//   String hotelName;
//   var hotelTypeId;
//   var noOfnights;
//   var nativeContry;
//   dynamic hotelType;
//   dynamic hotelCategory;
//   dynamic childChargeableAgeMax;
//   dynamic childComAgeMax;
//   String hotelDetails;
//   String imageName;
//   dynamic markupType;
//   dynamic markup;
//   dynamic currencyValue;
//   var totalRateMax;
//   var totalRateMin;
//   String apiType;
//   CancellationPenalty cancellationPenalty;
//   String platForm;
//   dynamic searchParams;
//   dynamic serachCityOrCountryId;
//   dynamic atharvaHotels;
//   var cityId;
//   String roomNo;
//   dynamic hotelSearchIwtxResponse;
//   var atharvaCityId;
//   dynamic atharvahCode;
//   dynamic atharvaTokenId;
//   dynamic atharvaStarRating;
//   dynamic atharvaHotelImages;
//   dynamic iwtxContractId;
//   var iwtxRate;
//   dynamic room;
//   dynamic hiddenRooms;
//   dynamic searchRoomDtOs;
//   List<SearchHotelRoomsDtoList> searchHotelRoomsDtoList;
//   dynamic atharvaHoteCodeSingleRoomResponse;
//   dynamic atharvaHoteCodeMultipleRoomResponse;
//   dynamic atharvaSingleRoomResponse;
//   dynamic atharvamultipleRoomResponse;
//   dynamic singleIwtxHotelSearchResponse;
//   dynamic multiIwtxHotelSearchResponse;
//   dynamic jumOwnHotelListDto;
//   dynamic jumRoomDetails;
//   dynamic jumeirahError;
//   dynamic checkIn;
//   dynamic checkOut;

//   RoomModel({
//     required this.hotelId,
//     required this.agentId,
//     required this.hotelCode,
//     required this.hotelName,
//     required this.hotelTypeId,
//     required this.noOfnights,
//     required this.nativeContry,
//     required this.hotelType,
//     required this.hotelCategory,
//     required this.childChargeableAgeMax,
//     required this.childComAgeMax,
//     required this.hotelDetails,
//     required this.imageName,
//     required this.markupType,
//     required this.markup,
//     required this.currencyValue,
//     required this.totalRateMax,
//     required this.totalRateMin,
//     required this.apiType,
//     required this.cancellationPenalty,
//     required this.platForm,
//     required this.searchParams,
//     required this.serachCityOrCountryId,
//     required this.atharvaHotels,
//     required this.cityId,
//     required this.roomNo,
//     required this.hotelSearchIwtxResponse,
//     required this.atharvaCityId,
//     required this.atharvahCode,
//     required this.atharvaTokenId,
//     required this.atharvaStarRating,
//     required this.atharvaHotelImages,
//     required this.iwtxContractId,
//     required this.iwtxRate,
//     required this.room,
//     required this.hiddenRooms,
//     required this.searchRoomDtOs,
//     required this.searchHotelRoomsDtoList,
//     required this.atharvaHoteCodeSingleRoomResponse,
//     required this.atharvaHoteCodeMultipleRoomResponse,
//     required this.atharvaSingleRoomResponse,
//     required this.atharvamultipleRoomResponse,
//     required this.singleIwtxHotelSearchResponse,
//     required this.multiIwtxHotelSearchResponse,
//     required this.jumOwnHotelListDto,
//     required this.jumRoomDetails,
//     required this.jumeirahError,
//     required this.checkIn,
//     required this.checkOut,
//   });

//   factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
//         hotelId: json["hotel_id"] ?? "",
//         agentId: json["agent_id"],
//         hotelCode: json["hotel_code"],
//         hotelName: json["hotel_name"],
//         hotelTypeId: json["hotel_type_id"],
//         noOfnights: json["noOfnights"],
//         nativeContry: json["nativeContry"],
//         hotelType: json["hotelType"],
//         hotelCategory: json["hotel_category"],
//         childChargeableAgeMax: json["childChargeableAgeMax"],
//         childComAgeMax: json["childComAgeMax"],
//         hotelDetails: json["hotel_details"],
//         imageName: json["imageName"],
//         markupType: json["markupType"],
//         markup: json["markup"],
//         currencyValue: json["currency_value"],
//         totalRateMax: json["totalRateMax"],
//         totalRateMin: json["totalRateMin"],
//         apiType: json["apiType"],
//         cancellationPenalty:
//             cancellationPenaltyValues.map[json["cancellationPenalty"]]!,
//         platForm: json["platForm"],
//         searchParams: json["searchParams"],
//         serachCityOrCountryId: json["serachCityOrCountryId"],
//         atharvaHotels: json["atharvaHotels"],
//         cityId: json["cityId"],
//         roomNo: json["roomNo"],
//         hotelSearchIwtxResponse: json["hotelSearchIWTXResponse"],
//         atharvaCityId: json["atharvaCityId"],
//         atharvahCode: json["atharvahCode"],
//         atharvaTokenId: json["atharvaTokenId"],
//         atharvaStarRating: json["atharva_star_rating"],
//         atharvaHotelImages: json["atharva_hotel_images"],
//         iwtxContractId: json["iwtxContractId"],
//         iwtxRate: json["iwtxRate"],
//         room: json["room"],
//         hiddenRooms: json["hiddenRooms"],
//         searchRoomDtOs: json["searchRoomDTOs"],
//         searchHotelRoomsDtoList: List<SearchHotelRoomsDtoList>.from(
//             json["searchHotelRoomsDTOList"]
//                 .map((x) => SearchHotelRoomsDtoList.fromJson(x))),
//         atharvaHoteCodeSingleRoomResponse:
//             json["atharvaHoteCodeSingleRoomResponse"],
//         atharvaHoteCodeMultipleRoomResponse:
//             json["atharvaHoteCodeMultipleRoomResponse"],
//         atharvaSingleRoomResponse: json["atharvaSingleRoomResponse"],
//         atharvamultipleRoomResponse: json["atharvamultipleRoomResponse"],
//         singleIwtxHotelSearchResponse: json["singleIwtxHotelSearchResponse"],
//         multiIwtxHotelSearchResponse: json["multiIwtxHotelSearchResponse"],
//         jumOwnHotelListDto: json["jumOwnHotelListDTO"],
//         jumRoomDetails: json["jumRoomDetails"],
//         jumeirahError: json["jumeirahError"],
//         checkIn: json["checkIn"],
//         checkOut: json["checkOut"],
//       );

//   Map<String, dynamic> toJson() => {
//         "hotel_id": hotelId,
//         "agent_id": agentId,
//         "hotel_code": hotelCode,
//         "hotel_name": hotelName,
//         "hotel_type_id": hotelTypeId,
//         "noOfnights": noOfnights,
//         "nativeContry": nativeContry,
//         "hotelType": hotelType,
//         "hotel_category": hotelCategory,
//         "childChargeableAgeMax": childChargeableAgeMax,
//         "childComAgeMax": childComAgeMax,
//         "hotel_details": hotelDetails,
//         "imageName": imageName,
//         "markupType": markupType,
//         "markup": markup,
//         "currency_value": currencyValue,
//         "totalRateMax": totalRateMax,
//         "totalRateMin": totalRateMin,
//         "apiType": apiType,
//         "cancellationPenalty":
//             cancellationPenaltyValues.reverse[cancellationPenalty],
//         "platForm": platForm,
//         "searchParams": searchParams,
//         "serachCityOrCountryId": serachCityOrCountryId,
//         "atharvaHotels": atharvaHotels,
//         "cityId": cityId,
//         "roomNo": roomNo,
//         "hotelSearchIWTXResponse": hotelSearchIwtxResponse,
//         "atharvaCityId": atharvaCityId,
//         "atharvahCode": atharvahCode,
//         "atharvaTokenId": atharvaTokenId,
//         "atharva_star_rating": atharvaStarRating,
//         "atharva_hotel_images": atharvaHotelImages,
//         "iwtxContractId": iwtxContractId,
//         "iwtxRate": iwtxRate,
//         "room": room,
//         "hiddenRooms": hiddenRooms,
//         "searchRoomDTOs": searchRoomDtOs,
//         "searchHotelRoomsDTOList":
//             List<dynamic>.from(searchHotelRoomsDtoList.map((x) => x.toJson())),
//         "atharvaHoteCodeSingleRoomResponse": atharvaHoteCodeSingleRoomResponse,
//         "atharvaHoteCodeMultipleRoomResponse":
//             atharvaHoteCodeMultipleRoomResponse,
//         "atharvaSingleRoomResponse": atharvaSingleRoomResponse,
//         "atharvamultipleRoomResponse": atharvamultipleRoomResponse,
//         "singleIwtxHotelSearchResponse": singleIwtxHotelSearchResponse,
//         "multiIwtxHotelSearchResponse": multiIwtxHotelSearchResponse,
//         "jumOwnHotelListDTO": jumOwnHotelListDto,
//         "jumRoomDetails": jumRoomDetails,
//         "jumeirahError": jumeirahError,
//         "checkIn": checkIn,
//         "checkOut": checkOut,
//       };
// }

// enum CancellationPenalty { N }

// final cancellationPenaltyValues = EnumValues({"N": CancellationPenalty.N});

// class SearchHotelRoomsDtoList {
//   var hotelRoomCategoryId;
//   var hotelRoomtypeId;
//   var roomCategoryId;
//   var roomTypeId;
//   var hotelId;
//   dynamic roomdetails;
//   var minimumDays;
//   var availableroom;
//   String roomCategory;
//   String roomType;
//   RateType rateType;
//   dynamic remark;
//   String types;
//   CancellationPenalty refundStatus;
//   double totalRate;
//   double totalRateWithMarkup;
//   String intoken;
//   CancellationPenalty cancellationPenalty;
//   String jumNoOfUnitsAvailable;
//   String jumMaxOccupancy;
//   dynamic filterHotelRoomsOccupancyDtoList;
//   CancellationPolicy cancellationPolicy;
//   GuaranteePolicy guaranteePolicy;
//   bool breakfastIncluded;
//   bool lunchIncluded;
//   bool dinnerIncluded;
//   var mealPlanCode;
//   dynamic planFeatures;
//   dynamic deadlineDate;

//   SearchHotelRoomsDtoList({
//     required this.hotelRoomCategoryId,
//     required this.hotelRoomtypeId,
//     required this.roomCategoryId,
//     required this.roomTypeId,
//     required this.hotelId,
//     required this.roomdetails,
//     required this.minimumDays,
//     required this.availableroom,
//     required this.roomCategory,
//     required this.roomType,
//     required this.rateType,
//     required this.remark,
//     required this.types,
//     required this.refundStatus,
//     required this.totalRate,
//     required this.totalRateWithMarkup,
//     required this.intoken,
//     required this.cancellationPenalty,
//     required this.jumNoOfUnitsAvailable,
//     required this.jumMaxOccupancy,
//     required this.filterHotelRoomsOccupancyDtoList,
//     required this.cancellationPolicy,
//     required this.guaranteePolicy,
//     required this.breakfastIncluded,
//     required this.lunchIncluded,
//     required this.dinnerIncluded,
//     required this.mealPlanCode,
//     required this.planFeatures,
//     required this.deadlineDate,
//   });

//   factory SearchHotelRoomsDtoList.fromJson(Map<String, dynamic> json) =>
//       SearchHotelRoomsDtoList(
//         hotelRoomCategoryId: json["hotel_room_category_id"],
//         hotelRoomtypeId: json["hotel_roomtype_id"],
//         roomCategoryId: json["room_category_id"],
//         roomTypeId: json["room_type_id"],
//         hotelId: json["hotel_id"],
//         roomdetails: json["roomdetails"],
//         minimumDays: json["minimumDays"],
//         availableroom: json["availableroom"],
//         roomCategory: json["roomCategory"],
//         roomType: json["roomType"],
//         rateType: rateTypeValues.map[json["rateType"]]!,
//         remark: json["remark"],
//         types: json["types"],
//         refundStatus: cancellationPenaltyValues.map[json["refundStatus"]]!,
//         totalRate: json["totalRate"]?.toDouble(),
//         totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
//         intoken: json["intoken"],
//         cancellationPenalty:
//             cancellationPenaltyValues.map[json["cancellationPenalty"]]!,
//         jumNoOfUnitsAvailable: json["jumNoOfUnitsAvailable"],
//         jumMaxOccupancy: json["jum_Max_Occupancy"],
//         filterHotelRoomsOccupancyDtoList:
//             json["filterHotelRoomsOccupancyDTOList"],
//         cancellationPolicy:
//             CancellationPolicy.fromJson(json["cancellation_policy"]),
//         guaranteePolicy: GuaranteePolicy.fromJson(json["guarantee_policy"]),
//         breakfastIncluded: json["breakfast_included"],
//         lunchIncluded: json["lunch_included"],
//         dinnerIncluded: json["dinner_included"],
//         mealPlanCode: json["meal_plan_code"],
//         planFeatures: json["plan_features"],
//         deadlineDate: json["deadlineDate"],
//       );

//   Map<String, dynamic> toJson() => {
//         "hotel_room_category_id": hotelRoomCategoryId,
//         "hotel_roomtype_id": hotelRoomtypeId,
//         "room_category_id": roomCategoryId,
//         "room_type_id": roomTypeId,
//         "hotel_id": hotelId,
//         "roomdetails": roomdetails,
//         "minimumDays": minimumDays,
//         "availableroom": availableroom,
//         "roomCategory": roomCategory,
//         "roomType": roomType,
//         "rateType": rateTypeValues.reverse[rateType],
//         "remark": remark,
//         "types": types,
//         "refundStatus": cancellationPenaltyValues.reverse[refundStatus],
//         "totalRate": totalRate,
//         "totalRateWithMarkup": totalRateWithMarkup,
//         "intoken": intoken,
//         "cancellationPenalty":
//             cancellationPenaltyValues.reverse[cancellationPenalty],
//         "jumNoOfUnitsAvailable": jumNoOfUnitsAvailable,
//         "jum_Max_Occupancy": jumMaxOccupancy,
//         "filterHotelRoomsOccupancyDTOList": filterHotelRoomsOccupancyDtoList,
//         "cancellation_policy": cancellationPolicy.toJson(),
//         "guarantee_policy": guaranteePolicy.toJson(),
//         "breakfast_included": breakfastIncluded,
//         "lunch_included": lunchIncluded,
//         "dinner_included": dinnerIncluded,
//         "meal_plan_code": mealPlanCode,
//         "plan_features": planFeatures,
//         "deadlineDate": deadlineDate,
//       };
// }

// class CancellationPolicy {
//   String policyText;
//   double penaltyAmount;
//   CurrencyCode currencyCode;
//   dynamic penaltyInclusiveTax;
//   CancellationPolicyPolicyCode policyCode;
//   dynamic absoluteDeadlineDatetime;
//   OffsetDeadlineTime offsetDeadlineTime;
//   OffsetDeadlineTimeUnit offsetDeadlineTimeUnit;
//   String offsetDeadlineTimeUnitMultiplier;
//   bool cancellationAllowed;

//   CancellationPolicy({
//     required this.policyText,
//     required this.penaltyAmount,
//     required this.currencyCode,
//     required this.penaltyInclusiveTax,
//     required this.policyCode,
//     required this.absoluteDeadlineDatetime,
//     required this.offsetDeadlineTime,
//     required this.offsetDeadlineTimeUnit,
//     required this.offsetDeadlineTimeUnitMultiplier,
//     required this.cancellationAllowed,
//   });

//   factory CancellationPolicy.fromJson(Map<String, dynamic> json) =>
//       CancellationPolicy(
//         policyText: json["policy_text"],
//         penaltyAmount: json["penalty_amount"]?.toDouble(),
//         currencyCode: currencyCodeValues.map[json["currency_code"]]!,
//         penaltyInclusiveTax: json["penalty_inclusive_tax"],
//         policyCode:
//             cancellationPolicyPolicyCodeValues.map[json["policy_code"]]!,
//         absoluteDeadlineDatetime: json["absolute_deadline_datetime"],
//         offsetDeadlineTime:
//             offsetDeadlineTimeValues.map[json["offset_deadline_time"]]!,
//         offsetDeadlineTimeUnit: offsetDeadlineTimeUnitValues
//             .map[json["offset_deadline_time_unit"]]!,
//         offsetDeadlineTimeUnitMultiplier:
//             json["offset_deadline_time_unit_multiplier"],
//         cancellationAllowed: json["cancellation_allowed"],
//       );

//   Map<String, dynamic> toJson() => {
//         "policy_text": policyText,
//         "penalty_amount": penaltyAmount,
//         "currency_code": currencyCodeValues.reverse[currencyCode],
//         "penalty_inclusive_tax": penaltyInclusiveTax,
//         "policy_code":
//             cancellationPolicyPolicyCodeValues.reverse[policyCode] ?? "",
//         "absolute_deadline_datetime": absoluteDeadlineDatetime,
//         "offset_deadline_time":
//             offsetDeadlineTimeValues.reverse[offsetDeadlineTime],
//         "offset_deadline_time_unit":
//             offsetDeadlineTimeUnitValues.reverse[offsetDeadlineTimeUnit],
//         "offset_deadline_time_unit_multiplier":
//             offsetDeadlineTimeUnitMultiplier,
//         "cancellation_allowed": cancellationAllowed,
//       };
// }

// enum CurrencyCode { AED }

// final currencyCodeValues = EnumValues({"AED": CurrencyCode.AED});

// enum OffsetDeadlineTime { BEFORE_ARRIVAL }

// final offsetDeadlineTimeValues =
//     EnumValues({"BeforeArrival": OffsetDeadlineTime.BEFORE_ARRIVAL});

// enum OffsetDeadlineTimeUnit { DAY }

// final offsetDeadlineTimeUnitValues =
//     EnumValues({"Day": OffsetDeadlineTimeUnit.DAY});

// enum CancellationPolicyPolicyCode { THE_14_DAYS_100_PCT }

// final cancellationPolicyPolicyCodeValues = EnumValues(
//     {"14DAYS-100PCT": CancellationPolicyPolicyCode.THE_14_DAYS_100_PCT});

// class GuaranteePolicy {
//   PolicyText policyText;
//   var guaranteeAmount;
//   CurrencyCode currencyCode;
//   GuaranteePolicyPolicyCode policyCode;
//   dynamic deadlineTime;
//   dynamic deadlineTimeUnit;
//   dynamic deadlineTimeUnitMultiplier;

//   GuaranteePolicy({
//     required this.policyText,
//     required this.guaranteeAmount,
//     required this.currencyCode,
//     required this.policyCode,
//     required this.deadlineTime,
//     required this.deadlineTimeUnit,
//     required this.deadlineTimeUnitMultiplier,
//   });

//   factory GuaranteePolicy.fromJson(Map<String, dynamic> json) =>
//       GuaranteePolicy(
//         policyText: policyTextValues.map[json["policy_text"]]!,
//         guaranteeAmount: json["guarantee_amount"],
//         currencyCode: currencyCodeValues.map[json["currency_code"]]!,
//         policyCode: guaranteePolicyPolicyCodeValues.map[json["policy_code"]]!,
//         deadlineTime: json["deadline_time"],
//         deadlineTimeUnit: json["deadline_time_unit"],
//         deadlineTimeUnitMultiplier: json["deadline_time_unit_multiplier"],
//       );

//   Map<String, dynamic> toJson() => {
//         "policy_text": policyTextValues.reverse[policyText],
//         "guarantee_amount": guaranteeAmount,
//         "currency_code": currencyCodeValues.reverse[currencyCode],
//         "policy_code": guaranteePolicyPolicyCodeValues.reverse[policyCode],
//         "deadline_time": deadlineTime,
//         "deadline_time_unit": deadlineTimeUnit,
//         "deadline_time_unit_multiplier": deadlineTimeUnitMultiplier,
//       };
// }

// enum GuaranteePolicyPolicyCode { CC }

// final guaranteePolicyPolicyCodeValues =
//     EnumValues({"CC": GuaranteePolicyPolicyCode.CC});

// enum PolicyText { RESERVATION_MUST_BE_GUARANTEED_WITH_A_VALID_CREDIT_CARD }

// final policyTextValues = EnumValues({
//   "Reservation must be guaranteed with a valid credit card":
//       PolicyText.RESERVATION_MUST_BE_GUARANTEED_WITH_A_VALID_CREDIT_CARD
// });

// enum RateType { XBARRONS, XDN1_BBNS, XDN1_HBNS }

// final rateTypeValues = EnumValues({
//   "XBARRONS": RateType.XBARRONS,
//   "XDN1BBNS": RateType.XDN1_BBNS,
//   "XDN1HBNS": RateType.XDN1_HBNS
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final roomModel = roomModelFromJson(jsonString);

import 'dart:convert';

List<RoomModel> roomModelFromJson(String str) =>
    List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromJson(x)));

String roomModelToJson(List<RoomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomModel {
  int hotelId;
  int agentId;
  String hotelCode;
  String hotelName;
  dynamic hotelTypeId;
  dynamic noOfnights;
  dynamic nativeContry;
  dynamic hotelType;
  dynamic hotelCategory;
  dynamic childChargeableAgeMax;
  dynamic childComAgeMax;
  dynamic hotelDetails;
  dynamic imageName;
  dynamic markupType;
  dynamic markup;
  dynamic currencyValue;
  dynamic totalRateMax;
  dynamic totalRateMin;
  dynamic apiType;
  dynamic cancellationPenalty;
  dynamic platForm;
  dynamic searchParams;
  dynamic serachCityOrCountryId;
  dynamic atharvaHotels;
  dynamic cityId;
  dynamic roomNo;
  dynamic hotelSearchIwtxResponse;
  dynamic atharvaCityId;
  dynamic atharvahCode;
  dynamic atharvaTokenId;
  dynamic atharvaStarRating;
  dynamic atharvaHotelImages;
  dynamic iwtxContractId;
  double iwtxRate;
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

  RoomModel({
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

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        hotelId: json["hotel_id"],
        agentId: json["agent_id"],
        hotelCode: json["hotel_code"],
        hotelName: json["hotel_name"],
        hotelTypeId: json["hotel_type_id"],
        noOfnights: json["noOfnights"],
        nativeContry: json["nativeContry"],
        hotelType: json["hotelType"],
        hotelCategory: json["hotel_category"],
        childChargeableAgeMax: json["childChargeableAgeMax"],
        childComAgeMax: json["childComAgeMax"],
        hotelDetails: json["hotel_details"],
        imageName: json["imageName"],
        markupType: json["markupType"],
        markup: json["markup"],
        currencyValue: json["currency_value"],
        totalRateMax: json["totalRateMax"],
        totalRateMin: json["totalRateMin"],
        apiType: json["apiType"],
        cancellationPenalty: json["cancellationPenalty"],
        platForm: json["platForm"],
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
        "hotelType": hotelType,
        "hotel_category": hotelCategory,
        "childChargeableAgeMax": childChargeableAgeMax,
        "childComAgeMax": childComAgeMax,
        "hotel_details": hotelDetails,
        "imageName": imageName,
        "markupType": markupType,
        "markup": markup,
        "currency_value": currencyValue,
        "totalRateMax": totalRateMax,
        "totalRateMin": totalRateMin,
        "apiType": apiType,
        "cancellationPenalty": cancellationPenalty,
        "platForm": platForm,
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

class SearchHotelRoomsDtoList {
  dynamic hotelRoomCategoryId;
  dynamic hotelRoomtypeId;
  dynamic roomCategoryId;
  dynamic roomTypeId;
  dynamic hotelId;
  dynamic roomdetails;
  dynamic minimumDays;
  dynamic availableroom;
  String roomCategory;
  String roomType;
  dynamic rateType;
  dynamic remark;
  dynamic types;
  dynamic refundStatus;
  double totalRate;
  double totalRateWithMarkup;
  dynamic intoken;
  dynamic cancellationPenalty;
  dynamic jumNoOfUnitsAvailable;
  dynamic jumMaxOccupancy;
  dynamic filterHotelRoomsOccupancyDtoList;
  CancellationPolicy cancellationPolicy;
  GuaranteePolicy guaranteePolicy;
  bool breakfastIncluded;
  bool lunchIncluded;
  bool dinnerIncluded;
  dynamic mealPlanCode;
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
        roomType: json["roomType"],
        rateType: json["rateType"],
        remark: json["remark"],
        types: json["types"],
        refundStatus: json["refundStatus"],
        totalRate: json["totalRate"]?.toDouble(),
        totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
        intoken: json["intoken"],
        cancellationPenalty: json["cancellationPenalty"],
        jumNoOfUnitsAvailable: json["jumNoOfUnitsAvailable"],
        jumMaxOccupancy: json["jum_Max_Occupancy"],
        filterHotelRoomsOccupancyDtoList:
            json["filterHotelRoomsOccupancyDTOList"],
        cancellationPolicy:
            CancellationPolicy.fromJson(json["cancellation_policy"]),
        guaranteePolicy: GuaranteePolicy.fromJson(json["guarantee_policy"]),
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
        "roomType": roomType,
        "rateType": rateType,
        "remark": remark,
        "types": types,
        "refundStatus": refundStatus,
        "totalRate": totalRate,
        "totalRateWithMarkup": totalRateWithMarkup,
        "intoken": intoken,
        "cancellationPenalty": cancellationPenalty,
        "jumNoOfUnitsAvailable": jumNoOfUnitsAvailable,
        "jum_Max_Occupancy": jumMaxOccupancy,
        "filterHotelRoomsOccupancyDTOList": filterHotelRoomsOccupancyDtoList,
        "cancellation_policy": cancellationPolicy.toJson(),
        "guarantee_policy": guaranteePolicy.toJson(),
        "breakfast_included": breakfastIncluded,
        "lunch_included": lunchIncluded,
        "dinner_included": dinnerIncluded,
        "meal_plan_code": mealPlanCode,
        "plan_features": planFeatures,
        "deadlineDate": deadlineDate,
      };
}

class CancellationPolicy {
  String policyText;
  double penaltyAmount;
  String currencyCode;
  dynamic penaltyInclusiveTax;
  String policyCode;
  dynamic absoluteDeadlineDatetime;
  String offsetDeadlineTime;
  String offsetDeadlineTimeUnit;
  String offsetDeadlineTimeUnitMultiplier;
  bool cancellationAllowed;

  CancellationPolicy({
    required this.policyText,
    required this.penaltyAmount,
    required this.currencyCode,
    required this.penaltyInclusiveTax,
    required this.policyCode,
    required this.absoluteDeadlineDatetime,
    required this.offsetDeadlineTime,
    required this.offsetDeadlineTimeUnit,
    required this.offsetDeadlineTimeUnitMultiplier,
    required this.cancellationAllowed,
  });

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) =>
      CancellationPolicy(
        policyText: json["policy_text"],
        penaltyAmount: json["penalty_amount"]?.toDouble(),
        currencyCode: json["currency_code"],
        penaltyInclusiveTax: json["penalty_inclusive_tax"],
        policyCode: json["policy_code"],
        absoluteDeadlineDatetime: json["absolute_deadline_datetime"],
        offsetDeadlineTime: json["offset_deadline_time"],
        offsetDeadlineTimeUnit: json["offset_deadline_time_unit"],
        offsetDeadlineTimeUnitMultiplier:
            json["offset_deadline_time_unit_multiplier"],
        cancellationAllowed: json["cancellation_allowed"],
      );

  Map<String, dynamic> toJson() => {
        "policy_text": policyText,
        "penalty_amount": penaltyAmount,
        "currency_code": currencyCode,
        "penalty_inclusive_tax": penaltyInclusiveTax,
        "policy_code": policyCode,
        "absolute_deadline_datetime": absoluteDeadlineDatetime,
        "offset_deadline_time": offsetDeadlineTime,
        "offset_deadline_time_unit": offsetDeadlineTimeUnit,
        "offset_deadline_time_unit_multiplier":
            offsetDeadlineTimeUnitMultiplier,
        "cancellation_allowed": cancellationAllowed,
      };
}

class GuaranteePolicy {
  dynamic policyText;
  dynamic guaranteeAmount;
  dynamic currencyCode;
  dynamic policyCode;
  dynamic deadlineTime;
  dynamic deadlineTimeUnit;
  dynamic deadlineTimeUnitMultiplier;

  GuaranteePolicy({
    required this.policyText,
    required this.guaranteeAmount,
    required this.currencyCode,
    required this.policyCode,
    required this.deadlineTime,
    required this.deadlineTimeUnit,
    required this.deadlineTimeUnitMultiplier,
  });

  factory GuaranteePolicy.fromJson(Map<String, dynamic> json) =>
      GuaranteePolicy(
        policyText: json["policy_text"],
        guaranteeAmount: json["guarantee_amount"],
        currencyCode: json["currency_code"],
        policyCode: json["policy_code"],
        deadlineTime: json["deadline_time"],
        deadlineTimeUnit: json["deadline_time_unit"],
        deadlineTimeUnitMultiplier: json["deadline_time_unit_multiplier"],
      );

  Map<String, dynamic> toJson() => {
        "policy_text": policyText,
        "guarantee_amount": guaranteeAmount,
        "currency_code": currencyCode,
        "policy_code": policyCode,
        "deadline_time": deadlineTime,
        "deadline_time_unit": deadlineTimeUnit,
        "deadline_time_unit_multiplier": deadlineTimeUnitMultiplier,
      };
}
