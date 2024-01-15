// // To parse this JSON data, do
// //
// //     final roomCategoryModel = roomCategoryModelFromJson(jsonString);

// import 'dart:convert';

// RoomCategoryModel roomCategoryModelFromJson(String str) =>
//     RoomCategoryModel.fromJson(json.decode(str));

// String roomCategoryModelToJson(RoomCategoryModel data) =>
//     json.encode(data.toJson());

// class RoomCategoryModel {
//   int status;
//   String message;
//   List<RoomCategoryModelDatum> data;
//   dynamic token;

//   RoomCategoryModel({
//     required this.status,
//     required this.message,
//     required this.data,
//     required this.token,
//   });

//   factory RoomCategoryModel.fromJson(Map<String, dynamic> json) =>
//       RoomCategoryModel(
//         status: json["status"],
//         message: json["message"],
//         data: List<RoomCategoryModelDatum>.from(
//             json["data"].map((x) => RoomCategoryModelDatum.fromJson(x))),
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "token": token,
//       };
// }

// class RoomCategoryModelDatum {
//   InhouseRooms? inhouseRooms;
//   dynamic jumeirahRooms;
//   dynamic iwtxRooms;

//   RoomCategoryModelDatum({
//     this.inhouseRooms,
//     this.jumeirahRooms,
//     this.iwtxRooms,
//   });

//   factory RoomCategoryModelDatum.fromJson(Map<String, dynamic> json) =>
//       RoomCategoryModelDatum(
//         inhouseRooms: json["inhouse_rooms"] == null
//             ? null
//             : InhouseRooms.fromJson(json["inhouse_rooms"]),
//         jumeirahRooms:
//             json["jumeirah_rooms"] == null ? null : json["jumeirah_rooms"],
//         iwtxRooms: json["iwtx_rooms"] == null ? null : json["iwtx_rooms"],
//       );

//   Map<String, dynamic> toJson() => {
//         "inhouse_rooms": inhouseRooms?.toJson(),
//         "jumeirah_rooms": jumeirahRooms?.toJson(),
//         "iwtx_rooms": iwtxRooms?.toJson(),
//       };
// }

// class InhouseRooms {
//   List<dynamic> data;

//   InhouseRooms({
//     required this.data,
//   });

//   factory InhouseRooms.fromJson(Map<String, dynamic> json) => InhouseRooms(
//         data: List<dynamic>.from(json["data"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x)),
//       };
// }

// class DatumDatum {
//   int hotelId;
//   dynamic agentId;
//   dynamic hotelCode;
//   dynamic hotelName;
//   dynamic hotelTypeId;
//   dynamic noOfnights;
//   dynamic nativeContry;
//   Type? hotelType;
//   dynamic hotelCategory;
//   dynamic childChargeableAgeMax;
//   dynamic childComAgeMax;
//   dynamic hotelDetails;
//   dynamic imageName;
//   dynamic markupType;
//   dynamic markup;
//   dynamic currencyValue;
//   dynamic totalRateMax;
//   dynamic totalRateMin;
//   dynamic apiType;
//   dynamic cancellationPenalty;
//   dynamic platForm;
//   dynamic searchParams;
//   dynamic serachCityOrCountryId;
//   dynamic atharvaHotels;
//   dynamic cityId;
//   dynamic roomNo;
//   dynamic hotelSearchIwtxResponse;
//   dynamic atharvaCityId;
//   dynamic atharvahCode;
//   dynamic atharvaTokenId;
//   dynamic atharvaStarRating;
//   dynamic atharvaHotelImages;
//   dynamic iwtxContractId;
//   dynamic iwtxRate;
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

//   DatumDatum({
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

//   factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
//         hotelId: json["hotel_id"],
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
//         cancellationPenalty: json["cancellationPenalty"]!,
//         platForm: json["platForm"]!,
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
//         "cancellationPenalty": cancellationPenalty,
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

// // enum CancellationPenalty { N, Y }

// // final cancellationPenaltyValues =
// //     EnumValues({"N": CancellationPenalty.N, "Y": CancellationPenalty.Y});

// // enum Type { APARTMENTS, HOTEL, RESORT, VILLAS }

// // final typeValues = EnumValues({
// //   "Apartments": Type.APARTMENTS,
// //   "Hotel": Type.HOTEL,
// //   "Resort": Type.RESORT,
// //   "Villas": Type.VILLAS
// // });

// // enum PlatForm { INHOUSE, JUMEIRAH }

// // final platFormValues =
// //     EnumValues({"inhouse": PlatForm.INHOUSE, "jumeirah": PlatForm.JUMEIRAH});

// class SearchHotelRoomsDtoList {
//   dynamic hotelRoomCategoryId;
//   dynamic hotelRoomtypeId;
//   dynamic roomCategoryId;
//   dynamic roomTypeId;
//   dynamic hotelId;
//   dynamic roomdetails;
//   dynamic minimumDays;
//   dynamic availableroom;
//   dynamic roomCategory;
//   dynamic roomType;
//   dynamic rateType;
//   dynamic remark;
//   dynamic types;
//   dynamic refundStatus;
//   dynamic totalRate;
//   dynamic totalRateWithMarkup;
//   dynamic intoken;
//   dynamic cancellationPenalty;
//   dynamic jumNoOfUnitsAvailable;
//   dynamic jumMaxOccupancy;
//   List<FilterHotelRoomsOccupancyDtoList>? filterHotelRoomsOccupancyDtoList;
//   CancellationPolicy? cancellationPolicy;
//   GuaranteePolicy? guaranteePolicy;
//   bool? breakfastIncluded;
//   bool? lunchIncluded;
//   bool? dinnerIncluded;
//   dynamic mealPlanCode;
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
//         roomType: json["roomType"]!,
//         rateType: json["rateType"]!,
//         remark: json["remark"],
//         types: json["types"],
//         refundStatus: json["refundStatus"]!,
//         totalRate: json["totalRate"]?.toDouble(),
//         totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
//         intoken: json["intoken"],
//         cancellationPenalty: json["cancellationPenalty"]!,
//         jumNoOfUnitsAvailable: json["jumNoOfUnitsAvailable"],
//         jumMaxOccupancy: json["jum_Max_Occupancy"],
//         filterHotelRoomsOccupancyDtoList:
//             json["filterHotelRoomsOccupancyDTOList"] == null
//                 ? []
//                 : List<FilterHotelRoomsOccupancyDtoList>.from(
//                     json["filterHotelRoomsOccupancyDTOList"]!.map(
//                         (x) => FilterHotelRoomsOccupancyDtoList.fromJson(x))),
//         cancellationPolicy: json["cancellation_policy"] == null
//             ? null
//             : CancellationPolicy.fromJson(json["cancellation_policy"]),
//         guaranteePolicy: json["guarantee_policy"] == null
//             ? null
//             : GuaranteePolicy.fromJson(json["guarantee_policy"]),
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
//         "rateType": rateType,
//         "remark": remark,
//         "types": types,
//         "refundStatus": refundStatus,
//         "totalRate": totalRate,
//         "totalRateWithMarkup": totalRateWithMarkup,
//         "intoken": intoken,
//         "cancellationPenalty": cancellationPenalty,
//         "jumNoOfUnitsAvailable": jumNoOfUnitsAvailable,
//         "jum_Max_Occupancy": jumMaxOccupancy,
//         "filterHotelRoomsOccupancyDTOList":
//             filterHotelRoomsOccupancyDtoList == null
//                 ? []
//                 : List<dynamic>.from(
//                     filterHotelRoomsOccupancyDtoList!.map((x) => x.toJson())),
//         "cancellation_policy": cancellationPolicy?.toJson(),
//         "guarantee_policy": guaranteePolicy?.toJson(),
//         "breakfast_included": breakfastIncluded,
//         "lunch_included": lunchIncluded,
//         "dinner_included": dinnerIncluded,
//         "meal_plan_code": mealPlanCode,
//         "plan_features": planFeatures,
//         "deadlineDate": deadlineDate,
//       };
// }

// class CancellationPolicy {
//   dynamic policyText;
//   dynamic penaltyAmount;
//   dynamic currencyCode;
//   dynamic penaltyInclusiveTax;
//   dynamic policyCode;
//   dynamic absoluteDeadlineDatetime;
//   dynamic offsetDeadlineTime;
//   dynamic offsetDeadlineTimeUnit;
//   dynamic offsetDeadlineTimeUnitMultiplier;
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
//         currencyCode: json["currency_code"]!,
//         penaltyInclusiveTax: json["penalty_inclusive_tax"],
//         policyCode: json["policy_code"]!,
//         absoluteDeadlineDatetime: json["absolute_deadline_datetime"],
//         offsetDeadlineTime: json["offset_deadline_time"]!,
//         offsetDeadlineTimeUnit: json["offset_deadline_time_unit"]!,
//         offsetDeadlineTimeUnitMultiplier:
//             json["offset_deadline_time_unit_multiplier"],
//         cancellationAllowed: json["cancellation_allowed"],
//       );

//   Map<String, dynamic> toJson() => {
//         "policy_text": policyText,
//         "penalty_amount": penaltyAmount,
//         "currency_code": currencyCode,
//         "penalty_inclusive_tax": penaltyInclusiveTax,
//         "policy_code": policyCode,
//         "absolute_deadline_datetime": absoluteDeadlineDatetime,
//         "offset_deadline_time": offsetDeadlineTime,
//         "offset_deadline_time_unit": offsetDeadlineTimeUnit,
//         "offset_deadline_time_unit_multiplier":
//             offsetDeadlineTimeUnitMultiplier,
//         "cancellation_allowed": cancellationAllowed,
//       };
// }

// // enum CurrencyCode { AED }

// // final currencyCodeValues = EnumValues({"AED": CurrencyCode.AED});

// // enum OffsetDeadlineTime { BEFORE_ARRIVAL }

// // final offsetDeadlineTimeValues =
// //     EnumValues({"BeforeArrival": OffsetDeadlineTime.BEFORE_ARRIVAL});

// // enum OffsetDeadlineTimeUnit { DAY }

// // final offsetDeadlineTimeUnitValues =
// //     EnumValues({"Day": OffsetDeadlineTimeUnit.DAY});

// // enum CancellationPolicyPolicyCode { THE_21_DAYS_100_PCT }

// // final cancellationPolicyPolicyCodeValues = EnumValues(
// //     {"21DAYS-100PCT": CancellationPolicyPolicyCode.THE_21_DAYS_100_PCT});

// class FilterHotelRoomsOccupancyDtoList {
//   dynamic occupancyId;
//   dynamic occupancyType;
//   dynamic adultextrabed;
//   dynamic childextrabed;
//   dynamic totalAdult;
//   dynamic totalChild;
//   dynamic givenAdult;
//   dynamic givenChild;
//   List<dynamic> givenChildAge;
//   dynamic roomCategoryId;
//   dynamic totalRate;
//   dynamic totalRateWithMarkup;
//   List<EachDayRoomList> eachDayRoomList;

//   FilterHotelRoomsOccupancyDtoList({
//     required this.occupancyId,
//     required this.occupancyType,
//     required this.adultextrabed,
//     required this.childextrabed,
//     required this.totalAdult,
//     required this.totalChild,
//     required this.givenAdult,
//     required this.givenChild,
//     required this.givenChildAge,
//     required this.roomCategoryId,
//     required this.totalRate,
//     required this.totalRateWithMarkup,
//     required this.eachDayRoomList,
//   });

//   factory FilterHotelRoomsOccupancyDtoList.fromJson(
//           Map<String, dynamic> json) =>
//       FilterHotelRoomsOccupancyDtoList(
//         occupancyId: json["occupancy_id"],
//         occupancyType: json["occupancy_Type"]!,
//         adultextrabed: json["adultextrabed"],
//         childextrabed: json["childextrabed"],
//         totalAdult: json["totalAdult"],
//         totalChild: json["totalChild"],
//         givenAdult: json["givenAdult"],
//         givenChild: json["givenChild"],
//         givenChildAge: List<dynamic>.from(json["givenChildAge"].map((x) => x)),
//         roomCategoryId: json["room_category_id"],
//         totalRate: json["totalRate"],
//         totalRateWithMarkup: json["totalRateWithMarkup"],
//         eachDayRoomList: List<EachDayRoomList>.from(
//             json["eachDayRoomList"].map((x) => EachDayRoomList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "occupancy_id": occupancyId,
//         "occupancy_Type": occupancyType,
//         "adultextrabed": adultextrabed,
//         "childextrabed": childextrabed,
//         "totalAdult": totalAdult,
//         "totalChild": totalChild,
//         "givenAdult": givenAdult,
//         "givenChild": givenChild,
//         "givenChildAge": List<dynamic>.from(givenChildAge.map((x) => x)),
//         "room_category_id": roomCategoryId,
//         "totalRate": totalRate,
//         "totalRateWithMarkup": totalRateWithMarkup,
//         "eachDayRoomList":
//             List<dynamic>.from(eachDayRoomList.map((x) => x.toJson())),
//       };
// }

// class EachDayRoomList {
//   dynamic currDate;
//   dynamic priceType;
//   dynamic rateId;
//   dynamic priceCode;
//   dynamic days;
//   dynamic roomRate;
//   dynamic eventRate;
//   dynamic totalRate;
//   dynamic totalRateWithMarkup;
//   dynamic adultExtraBedRate;
//   dynamic childExtraBedRate;
//   dynamic roomRateWithMarkup;
//   dynamic eventRateWithMarkup;
//   dynamic adultExtraBedRateWithMarkup;
//   dynamic childExtraBedRateWithMarkup;
//   List<dynamic> events;
//   bool refund;

//   EachDayRoomList({
//     required this.currDate,
//     required this.priceType,
//     required this.rateId,
//     required this.priceCode,
//     required this.days,
//     required this.roomRate,
//     required this.eventRate,
//     required this.totalRate,
//     required this.totalRateWithMarkup,
//     required this.adultExtraBedRate,
//     required this.childExtraBedRate,
//     required this.roomRateWithMarkup,
//     required this.eventRateWithMarkup,
//     required this.adultExtraBedRateWithMarkup,
//     required this.childExtraBedRateWithMarkup,
//     required this.events,
//     required this.refund,
//   });

//   factory EachDayRoomList.fromJson(Map<String, dynamic> json) =>
//       EachDayRoomList(
//         currDate: json["currDate"]!,
//         priceType: json["priceType"]!,
//         rateId: json["rateId"],
//         priceCode: json["priceCode"],
//         days: json["days"]!,
//         roomRate: json["roomRate"],
//         eventRate: json["eventRate"],
//         totalRate: json["totalRate"],
//         totalRateWithMarkup: json["totalRateWithMarkup"],
//         adultExtraBedRate: json["adultExtraBedRate"],
//         childExtraBedRate: json["childExtraBedRate"],
//         roomRateWithMarkup: json["roomRateWithMarkup"],
//         eventRateWithMarkup: json["eventRateWithMarkup"],
//         adultExtraBedRateWithMarkup: json["adultExtraBedRateWithMarkup"],
//         childExtraBedRateWithMarkup: json["childExtraBedRateWithMarkup"],
//         events: List<dynamic>.from(json["events"].map((x) => x)),
//         refund: json["refund"],
//       );

//   Map<String, dynamic> toJson() => {
//         "currDate": currDate,
//         "priceType": priceType,
//         "rateId": rateId,
//         "priceCode": priceCode,
//         "days": days,
//         "roomRate": roomRate,
//         "eventRate": eventRate,
//         "totalRate": totalRate,
//         "totalRateWithMarkup": totalRateWithMarkup,
//         "adultExtraBedRate": adultExtraBedRate,
//         "childExtraBedRate": childExtraBedRate,
//         "roomRateWithMarkup": roomRateWithMarkup,
//         "eventRateWithMarkup": eventRateWithMarkup,
//         "adultExtraBedRateWithMarkup": adultExtraBedRateWithMarkup,
//         "childExtraBedRateWithMarkup": childExtraBedRateWithMarkup,
//         "events": List<dynamic>.from(events.map((x) => x)),
//         "refund": refund,
//       };
// }

// // enum CurrDate { THE_12012024 }

// // final currDateValues = EnumValues({"12/01/2024": CurrDate.THE_12012024});

// // enum Days { FRIDAY }

// // final daysValues = EnumValues({"Friday": Days.FRIDAY});

// // enum EType { CONTRACT, SPECIAL, XBARRONS, XDN1_BBNS, XDN1_HBNS, XSP1_BBNS }

// // final eTypeValues = EnumValues({
// //   "contract": EType.CONTRACT,
// //   "special": EType.SPECIAL,
// //   "XBARRONS": EType.XBARRONS,
// //   "XDN1BBNS": EType.XDN1_BBNS,
// //   "XDN1HBNS": EType.XDN1_HBNS,
// //   "XSP1BBNS": EType.XSP1_BBNS
// // });

// // enum OccupancyType { DOUBLE, OCTU, QUAD, SEXT, SINGLE, TRIPLE }

// // final occupancyTypeValues = EnumValues({
// //   "Double": OccupancyType.DOUBLE,
// //   "Octu": OccupancyType.OCTU,
// //   "Quad": OccupancyType.QUAD,
// //   "Sext": OccupancyType.SEXT,
// //   "Single": OccupancyType.SINGLE,
// //   "Triple": OccupancyType.TRIPLE
// // });

// class GuaranteePolicy {
//   dynamic policyText;
//   dynamic guaranteeAmount;
//   dynamic currencyCode;
//   dynamic policyCode;
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
//         policyText: json["policy_text"]!,
//         guaranteeAmount: json["guarantee_amount"],
//         currencyCode: json["currency_code"]!,
//         policyCode: json["policy_code"]!,
//         deadlineTime: json["deadline_time"],
//         deadlineTimeUnit: json["deadline_time_unit"],
//         deadlineTimeUnitMultiplier: json["deadline_time_unit_multiplier"],
//       );

//   Map<String, dynamic> toJson() => {
//         "policy_text": policyText,
//         "guarantee_amount": guaranteeAmount,
//         "currency_code": currencyCode,
//         "policy_code": policyCode,
//         "deadline_time": deadlineTime,
//         "deadline_time_unit": deadlineTimeUnit,
//         "deadline_time_unit_multiplier": deadlineTimeUnitMultiplier,
//       };
// }

// // enum GuaranteePolicyPolicyCode { CC }

// // final guaranteePolicyPolicyCodeValues =
// //     EnumValues({"CC": GuaranteePolicyPolicyCode.CC});

// // enum PolicyText { RESERVATION_MUST_BE_GUARANTEED_WITH_A_VALID_CREDIT_CARD }

// // final policyTextValues = EnumValues({
// //   "Reservation must be guaranteed with a valid credit card":
// //       PolicyText.RESERVATION_MUST_BE_GUARANTEED_WITH_A_VALID_CREDIT_CARD
// // });

// // enum RoomType {
// //   K1_CAA,
// //   K1_COA,
// //   K1_DAA,
// //   K1_LAA,
// //   ROOM_ONLY,
// //   ROOM_WITH_BREAK_FAST,
// //   ROOM_WITH_FULL_BOARD,
// //   ROOM_WITH_HALF_BOARD,
// //   Z1_AVA,
// //   Z1_JAA,
// //   Z1_OVA,
// //   Z2_POA,
// //   Z3_ROA
// // }

// // final roomTypeValues = EnumValues({
// //   "K1CAA": RoomType.K1_CAA,
// //   "K1COA": RoomType.K1_COA,
// //   "K1DAA": RoomType.K1_DAA,
// //   "K1LAA": RoomType.K1_LAA,
// //   "Room Only": RoomType.ROOM_ONLY,
// //   "Room with BreakFast": RoomType.ROOM_WITH_BREAK_FAST,
// //   "Room with FullBoard": RoomType.ROOM_WITH_FULL_BOARD,
// //   "Room with HalfBoard": RoomType.ROOM_WITH_HALF_BOARD,
// //   "Z1AVA": RoomType.Z1_AVA,
// //   "Z1JAA": RoomType.Z1_JAA,
// //   "Z1OVA": RoomType.Z1_OVA,
// //   "Z2POA": RoomType.Z2_POA,
// //   "Z3ROA": RoomType.Z3_ROA
// // });

// // class IwtxRooms {
// //   Data data;

// //   IwtxRooms({
// //     required this.data,
// //   });

// //   factory IwtxRooms.fromJson(Map<String, dynamic> json) => IwtxRooms(
// //         data: Data.fromJson(json["data"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "data": data.toJson(),
// //       };
// // }

// // class Data {
// //   dynamic errorMsg;
// //   Hotels hotels;

// //   Data({
// //     required this.errorMsg,
// //     required this.hotels,
// //   });

// //   factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         errorMsg: json["errorMsg"],
// //         hotels: Hotels.fromJson(json["hotels"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "errorMsg": errorMsg,
// //         "hotels": hotels.toJson(),
// //       };
// // }

// // class Hotels {
// //   Hotel hotel;

// //   Hotels({
// //     required this.hotel,
// //   });

// //   factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
// //         hotel: Hotel.fromJson(json["hotel"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "hotel": hotel.toJson(),
// //       };
// // }

// class Hotel {
//   dynamic country;
//   Type propertyType;
//   dynamic preferredStatus;
//   dynamic chain;
//   dynamic restriction;
//   RoomTypeDetails roomTypeDetails;
//   dynamic hotelId;
//   dynamic hotelName;
//   dynamic hotelCode;
//   dynamic city;
//   dynamic startDate;
//   dynamic endDate;
//   dynamic sourceId;
//   dynamic starRating;
//   GeoLocation geoLocation;

//   Hotel({
//     required this.country,
//     required this.propertyType,
//     required this.preferredStatus,
//     required this.chain,
//     required this.restriction,
//     required this.roomTypeDetails,
//     required this.hotelId,
//     required this.hotelName,
//     required this.hotelCode,
//     required this.city,
//     required this.startDate,
//     required this.endDate,
//     required this.sourceId,
//     required this.starRating,
//     required this.geoLocation,
//   });

//   factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
//         country: json["country"],
//         propertyType: json["propertyType"]!,
//         preferredStatus: json["preferredStatus"],
//         chain: json["chain"],
//         restriction: json["restriction"],
//         roomTypeDetails: RoomTypeDetails.fromJson(json["roomTypeDetails"]),
//         hotelId: json["hotelId"],
//         hotelName: json["hotelName"],
//         hotelCode: json["hotelCode"],
//         city: json["city"],
//         startDate: json["startDate"],
//         endDate: json["endDate"],
//         sourceId: json["sourceId"],
//         starRating: json["starRating"],
//         geoLocation: GeoLocation.fromJson(json["geoLocation"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "country": country,
//         "propertyType": propertyType,
//         "preferredStatus": preferredStatus,
//         "chain": chain,
//         "restriction": restriction,
//         "roomTypeDetails": roomTypeDetails.toJson(),
//         "hotelId": hotelId,
//         "hotelName": hotelName,
//         "hotelCode": hotelCode,
//         "city": city,
//         "startDate": startDate,
//         "endDate": endDate,
//         "sourceId": sourceId,
//         "starRating": starRating,
//         "geoLocation": geoLocation.toJson(),
//       };
// }

// class GeoLocation {
//   double latitude;
//   double longitude;

//   GeoLocation({
//     required this.latitude,
//     required this.longitude,
//   });

//   factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "latitude": latitude,
//         "longitude": longitude,
//       };
// }

// class RoomTypeDetails {
//   Rooms rooms;

//   RoomTypeDetails({
//     required this.rooms,
//   });

//   factory RoomTypeDetails.fromJson(Map<String, dynamic> json) =>
//       RoomTypeDetails(
//         rooms: Rooms.fromJson(json["rooms"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "rooms": rooms.toJson(),
//       };
// }

// class Rooms {
//   List<Room> room;

//   Rooms({
//     required this.room,
//   });

//   factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
//         room: List<Room>.from(json["room"].map((x) => Room.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "room": List<dynamic>.from(room.map((x) => x.toJson())),
//       };
// }

// class Room {
//   double totalRateWithMarkup;
//   dynamic roomNumber;
//   dynamic roomType;
//   dynamic rateDetails;
//   dynamic roomNo;
//   double totalRate;
//   double rate;
//   dynamic roomTypeCode;
//   dynamic mealPlanCode;
//   dynamic contractTokenId;
//   dynamic roomConfigurationId;
//   dynamic buyRate;
//   dynamic commissionSellCharges;
//   dynamic taxSellCharges;
//   CancellationPolicyDetails cancellationPolicyDetails;
//   dynamic promotionalContract;
//   dynamic packageYn;
//   dynamic nonRefundable;
//   dynamic dynamicYn;
//   dynamic rateBeforeTax;
//   dynamic totalDiscount;
//   bool recommendedRetailPrice;
//   dynamic contractLabel;
//   dynamic roomStatus;
//   dynamic roomTypeSupplierCode;
//   BlackOut blackOut;
//   dynamic currCode;
//   dynamic ratePlanCode;
//   dynamic ratePlanId;
//   dynamic mealPlan;
//   dynamic numberOfMeals;

//   Room({
//     required this.totalRateWithMarkup,
//     required this.roomNumber,
//     required this.roomType,
//     required this.rateDetails,
//     required this.roomNo,
//     required this.totalRate,
//     required this.rate,
//     required this.roomTypeCode,
//     required this.mealPlanCode,
//     required this.contractTokenId,
//     required this.roomConfigurationId,
//     required this.buyRate,
//     required this.commissionSellCharges,
//     required this.taxSellCharges,
//     required this.cancellationPolicyDetails,
//     required this.promotionalContract,
//     required this.packageYn,
//     required this.nonRefundable,
//     required this.dynamicYn,
//     required this.rateBeforeTax,
//     required this.totalDiscount,
//     required this.recommendedRetailPrice,
//     required this.contractLabel,
//     required this.roomStatus,
//     required this.roomTypeSupplierCode,
//     required this.blackOut,
//     required this.currCode,
//     required this.ratePlanCode,
//     required this.ratePlanId,
//     required this.mealPlan,
//     required this.numberOfMeals,
//   });

//   factory Room.fromJson(Map<String, dynamic> json) => Room(
//         totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
//         roomNumber: json["roomNumber"],
//         roomType: json["roomType"],
//         rateDetails: json["rateDetails"],
//         roomNo: json["roomNo"],
//         totalRate: json["totalRate"]?.toDouble(),
//         rate: json["rate"]?.toDouble(),
//         roomTypeCode: json["roomTypeCode"],
//         mealPlanCode: json["mealPlanCode"],
//         contractTokenId: json["contractTokenId"],
//         roomConfigurationId: json["roomConfigurationId"],
//         buyRate: json["buyRate"],
//         commissionSellCharges: json["commissionSellCharges"],
//         taxSellCharges: json["taxSellCharges"],
//         cancellationPolicyDetails: CancellationPolicyDetails.fromJson(
//             json["cancellationPolicyDetails"]),
//         promotionalContract: json["promotionalContract"]!,
//         packageYn: json["packageYN"]!,
//         nonRefundable: json["nonRefundable"]!,
//         dynamicYn: json["dynamicYN"]!,
//         rateBeforeTax: json["rateBeforeTax"]?.toDouble(),
//         totalDiscount: json["totalDiscount"],
//         recommendedRetailPrice: json["recommendedRetailPrice"],
//         contractLabel: json["contractLabel"],
//         roomStatus: json["roomStatus"]!,
//         roomTypeSupplierCode: json["roomTypeSupplierCode"],
//         blackOut: BlackOut.fromJson(json["blackOut"]),
//         currCode: json["currCode"]!,
//         ratePlanCode: json["ratePlanCode"],
//         ratePlanId: json["ratePlanId"],
//         mealPlan: json["mealPlan"]!,
//         numberOfMeals: json["numberOfMeals"],
//       );

//   Map<String, dynamic> toJson() => {
//         "totalRateWithMarkup": totalRateWithMarkup,
//         "roomNumber": roomNumber,
//         "roomType": roomType,
//         "rateDetails": rateDetails,
//         "roomNo": roomNo,
//         "totalRate": totalRate,
//         "rate": rate,
//         "roomTypeCode": roomTypeCode,
//         "mealPlanCode": mealPlanCode,
//         "contractTokenId": contractTokenId,
//         "roomConfigurationId": roomConfigurationId,
//         "buyRate": buyRate,
//         "commissionSellCharges": commissionSellCharges,
//         "taxSellCharges": taxSellCharges,
//         "cancellationPolicyDetails": cancellationPolicyDetails.toJson(),
//         "promotionalContract": promotionalContract,
//         "packageYN": packageYn,
//         "nonRefundable": nonRefundable,
//         "dynamicYN": dynamicYn,
//         "rateBeforeTax": rateBeforeTax,
//         "totalDiscount": totalDiscount,
//         "recommendedRetailPrice": recommendedRetailPrice,
//         "contractLabel": contractLabel,
//         "roomStatus": roomStatus,
//         "roomTypeSupplierCode": roomTypeSupplierCode,
//         "blackOut": blackOut.toJson(),
//         "currCode": currCode,
//         "ratePlanCode": ratePlanCode,
//         "ratePlanId": ratePlanId,
//         "mealPlan": mealPlan,
//         "numberOfMeals": numberOfMeals,
//       };
// }

// class BlackOut {
//   String msg;
//   String status;

//   BlackOut({
//     required this.msg,
//     required this.status,
//   });

//   factory BlackOut.fromJson(Map<String, dynamic> json) => BlackOut(
//         msg: json["msg"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "msg": msg,
//         "status": status,
//       };
// }

// class CancellationPolicyDetails {
//   List<Cancellation> cancellation;

//   CancellationPolicyDetails({
//     required this.cancellation,
//   });

//   factory CancellationPolicyDetails.fromJson(Map<String, dynamic> json) =>
//       CancellationPolicyDetails(
//         cancellation: List<Cancellation>.from(
//             json["cancellation"].map((x) => Cancellation.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "cancellation": List<dynamic>.from(cancellation.map((x) => x.toJson())),
//       };
// }

// class Cancellation {
//   String value;
//   dynamic percentOrAmt;
//   dynamic fromDate;
//   dynamic toDate;

//   Cancellation({
//     required this.value,
//     required this.percentOrAmt,
//     required this.fromDate,
//     required this.toDate,
//   });

//   factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
//         value: json["value"],
//         percentOrAmt: json["percentOrAmt"]!,
//         fromDate: json["fromDate"],
//         toDate: json["toDate"],
//       );

//   Map<String, dynamic> toJson() => {
//         "value": value,
//         "percentOrAmt": percentOrAmt,
//         "fromDate": fromDate,
//         "toDate": toDate,
//       };
// }

// // enum PercentOrAmt { P }

// // final percentOrAmtValues = EnumValues({"P": PercentOrAmt.P});

// // enum CurrCode { USD }

// // final currCodeValues = EnumValues({"USD": CurrCode.USD});

// // enum MealPlan { BREAKFAST, HALF_BOARD }

// // final mealPlanValues = EnumValues(
// //     {"Breakfast": MealPlan.BREAKFAST, "Half Board": MealPlan.HALF_BOARD});

// // enum RoomStatus { OK }

// // final roomStatusValues = EnumValues({"OK": RoomStatus.OK});

// // class JumeirahRooms {
// //   List<DatumDatum> data;

// //   JumeirahRooms({
// //     required this.data,
// //   });

// //   factory JumeirahRooms.fromJson(Map<String, dynamic> json) => JumeirahRooms(
// //         data: List<DatumDatum>.from(
// //             json["data"].map((x) => DatumDatum.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "data": List<dynamic>.from(data.map((x) => x.toJson())),
// //       };
// // }

// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     reverseMap = map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }
