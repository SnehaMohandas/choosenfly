// To parse this JSON data, do
//
//     final hotelDetailsModel = hotelDetailsModelFromJson(jsonString);

import 'dart:convert';

HotelDetailsModel hotelDetailsModelFromJson(String str) =>
    HotelDetailsModel.fromJson(json.decode(str));

String hotelDetailsModelToJson(HotelDetailsModel data) =>
    json.encode(data.toJson());

class HotelDetailsModel {
  int status;
  String message;
  List<HotelDetailsModelDatum> data;
  dynamic token;

  HotelDetailsModel({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  factory HotelDetailsModel.fromJson(Map<String, dynamic> json) =>
      HotelDetailsModel(
        status: json["status"],
        message: json["message"],
        data: List<HotelDetailsModelDatum>.from(
            json["data"].map((x) => HotelDetailsModelDatum.fromJson(x))),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "token": token,
      };
}

class HotelDetailsModelDatum {
  InhouseHotelDetails? inhouseHotelDetails;
  AtharvaHotelDetails? atharvaHotelDetails;
  JumeirahHotelDetails? jumeirahHotelDetails;
  IwtxHotelDetails? iwtxHotelDetails;

  HotelDetailsModelDatum({
    this.inhouseHotelDetails,
    this.atharvaHotelDetails,
    this.jumeirahHotelDetails,
    this.iwtxHotelDetails,
  });

  factory HotelDetailsModelDatum.fromJson(Map<String, dynamic> json) =>
      HotelDetailsModelDatum(
        inhouseHotelDetails: json["inhouse_hotelDetails"] == null
            ? null
            : InhouseHotelDetails.fromJson(json["inhouse_hotelDetails"]),
        atharvaHotelDetails: json["atharva_hotelDetails"] == null
            ? null
            : AtharvaHotelDetails.fromJson(json["atharva_hotelDetails"]),
        jumeirahHotelDetails: json["jumeirah_hotelDetails"] == null
            ? null
            : JumeirahHotelDetails.fromJson(json["jumeirah_hotelDetails"]),
        iwtxHotelDetails: json["iwtx_hotelDetails"] == null
            ? null
            : IwtxHotelDetails.fromJson(json["iwtx_hotelDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "inhouse_hotelDetails": inhouseHotelDetails?.toJson(),
        "atharva_hotelDetails": atharvaHotelDetails?.toJson(),
        "jumeirah_hotelDetails": jumeirahHotelDetails?.toJson(),
        "iwtx_hotelDetails": iwtxHotelDetails?.toJson(),
      };
}

class AtharvaHotelDetails {
  List<AtharvaHotelDetailsDatum> data;

  AtharvaHotelDetails({
    required this.data,
  });

  factory AtharvaHotelDetails.fromJson(Map<String, dynamic> json) =>
      AtharvaHotelDetails(
        data: List<AtharvaHotelDetailsDatum>.from(
            json["data"].map((x) => AtharvaHotelDetailsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AtharvaHotelDetailsDatum {
  int hotelId;
  dynamic hotelCode;
  dynamic hotelName;
  dynamic address;
  dynamic city;
  dynamic country;
  dynamic location;
  dynamic description;
  dynamic latitude;
  dynamic longitude;
  dynamic images;
  dynamic videos;
  bool openForBooking;
  dynamic starRating;

  AtharvaHotelDetailsDatum({
    required this.hotelId,
    required this.hotelCode,
    required this.hotelName,
    required this.address,
    required this.city,
    required this.country,
    required this.location,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.images,
    required this.videos,
    required this.openForBooking,
    required this.starRating,
  });

  factory AtharvaHotelDetailsDatum.fromJson(Map<String, dynamic> json) =>
      AtharvaHotelDetailsDatum(
        hotelId: json["hotelId"],
        hotelCode: json["hotel_code"],
        hotelName: json["hotel_name"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        location: json["location"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        images: json["images"],
        videos: json["videos"],
        openForBooking: json["open_for_booking"],
        starRating: json["star_rating"],
      );

  Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "hotel_code": hotelCode,
        "hotel_name": hotelName,
        "address": address,
        "city": city,
        "country": country,
        "location": location,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "images": images,
        "videos": videos,
        "open_for_booking": openForBooking,
        "star_rating": starRating,
      };
}

class InhouseHotelDetails {
  Data data;

  InhouseHotelDetails({
    required this.data,
  });

  factory InhouseHotelDetails.fromJson(Map<String, dynamic> json) =>
      InhouseHotelDetails(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  int hotelId;
  dynamic hotelCode;
  dynamic hotelName;
  dynamic hotelCategory;
  dynamic openimageName;
  dynamic hotelDetails;
  dynamic description;
  dynamic address;
  dynamic imageName;
  dynamic image360;
  bool openImage;
  dynamic occupancyType;
  dynamic typeId;
  dynamic checkIn;
  dynamic hotelType;
  dynamic latitude;
  dynamic longitude;
  List<HotelImageList> hotelImageList;
  List<dynamic> hotelMealPlanList;
  List<dynamic> contactDetailsList;
  List<dynamic> hotelBankDetailList;
  List<dynamic> hotelRoomCategoryList;
  List<HotelTermsandConditionsList> hotelTermsandConditionsList;
  List<HotelAmenitiesMainDtoList> hotelAmenitiesMainDtoList;
  List<dynamic> policyDetailsDtoList;

  Data({
    required this.hotelId,
    required this.hotelCode,
    required this.hotelName,
    required this.hotelCategory,
    required this.openimageName,
    required this.hotelDetails,
    required this.description,
    required this.address,
    required this.imageName,
    required this.image360,
    required this.openImage,
    required this.occupancyType,
    required this.typeId,
    required this.checkIn,
    required this.hotelType,
    required this.latitude,
    required this.longitude,
    required this.hotelImageList,
    required this.hotelMealPlanList,
    required this.contactDetailsList,
    required this.hotelBankDetailList,
    required this.hotelRoomCategoryList,
    required this.hotelTermsandConditionsList,
    required this.hotelAmenitiesMainDtoList,
    required this.policyDetailsDtoList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hotelId: json["hotel_id"],
        hotelCode: json["hotel_code"],
        hotelName: json["hotel_name"],
        hotelCategory: json["hotel_category"],
        openimageName: json["openimageName"],
        hotelDetails: json["hotel_details"],
        description: json["description"],
        address: json["address"],
        imageName: json["imageName"],
        image360: json["image360"],
        openImage: json["openImage"],
        occupancyType: json["occupancyType"],
        typeId: json["type_id"],
        checkIn: json["check_in"],
        hotelType: json["hotelType"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        hotelImageList: List<HotelImageList>.from(
            json["hotelImageList"].map((x) => HotelImageList.fromJson(x))),
        hotelMealPlanList:
            List<dynamic>.from(json["hotelMealPlanList"].map((x) => x)),
        contactDetailsList:
            List<dynamic>.from(json["contactDetailsList"].map((x) => x)),
        hotelBankDetailList:
            List<dynamic>.from(json["hotelBankDetailList"].map((x) => x)),
        hotelRoomCategoryList:
            List<dynamic>.from(json["hotelRoomCategoryList"].map((x) => x)),
        hotelTermsandConditionsList: List<HotelTermsandConditionsList>.from(
            json["hotelTermsandConditionsList"]
                .map((x) => HotelTermsandConditionsList.fromJson(x))),
        hotelAmenitiesMainDtoList: List<HotelAmenitiesMainDtoList>.from(
            json["hotelAmenitiesMainDTOList"]
                .map((x) => HotelAmenitiesMainDtoList.fromJson(x))),
        policyDetailsDtoList:
            List<dynamic>.from(json["policyDetailsDTOList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_code": hotelCode,
        "hotel_name": hotelName,
        "hotel_category": hotelCategory,
        "openimageName": openimageName,
        "hotel_details": hotelDetails,
        "description": description,
        "address": address,
        "imageName": imageName,
        "image360": image360,
        "openImage": openImage,
        "occupancyType": occupancyType,
        "type_id": typeId,
        "check_in": checkIn,
        "hotelType": hotelType,
        "latitude": latitude,
        "longitude": longitude,
        "hotelImageList":
            List<dynamic>.from(hotelImageList.map((x) => x.toJson())),
        "hotelMealPlanList":
            List<dynamic>.from(hotelMealPlanList.map((x) => x)),
        "contactDetailsList":
            List<dynamic>.from(contactDetailsList.map((x) => x)),
        "hotelBankDetailList":
            List<dynamic>.from(hotelBankDetailList.map((x) => x)),
        "hotelRoomCategoryList":
            List<dynamic>.from(hotelRoomCategoryList.map((x) => x)),
        "hotelTermsandConditionsList": List<dynamic>.from(
            hotelTermsandConditionsList.map((x) => x.toJson())),
        "hotelAmenitiesMainDTOList": List<dynamic>.from(
            hotelAmenitiesMainDtoList.map((x) => x.toJson())),
        "policyDetailsDTOList":
            List<dynamic>.from(policyDetailsDtoList.map((x) => x)),
      };
}

class HotelAmenitiesMainDtoList {
  dynamic hotelAmenitiesId;
  dynamic amentitiesId;
  dynamic hotelId;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedby;
  dynamic modifiedDate;
  dynamic id;
  dynamic localName;
  dynamic hotelamenitiesPrimaryIdArray;
  dynamic hotelamenitiesIdArray;
  bool deleted;

  HotelAmenitiesMainDtoList({
    required this.hotelAmenitiesId,
    required this.amentitiesId,
    required this.hotelId,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedby,
    required this.modifiedDate,
    required this.id,
    required this.localName,
    required this.hotelamenitiesPrimaryIdArray,
    required this.hotelamenitiesIdArray,
    required this.deleted,
  });

  factory HotelAmenitiesMainDtoList.fromJson(Map<String, dynamic> json) =>
      HotelAmenitiesMainDtoList(
        hotelAmenitiesId: json["hotel_amenities_id"],
        amentitiesId: json["amentities_id"],
        hotelId: json["hotel_id"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        modifiedby: json["modifiedby"],
        modifiedDate: json["modifiedDate"],
        id: json["id"],
        localName: json["localName"]!,
        hotelamenitiesPrimaryIdArray: json["hotelamenitiesPrimaryIdArray"],
        hotelamenitiesIdArray: json["hotelamenitiesIdArray"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_amenities_id": hotelAmenitiesId,
        "amentities_id": amentitiesId,
        "hotel_id": hotelId,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedby": modifiedby,
        "modifiedDate": modifiedDate,
        "id": id,
        "localName": localNameValues.reverse[localName],
        "hotelamenitiesPrimaryIdArray": hotelamenitiesPrimaryIdArray,
        "hotelamenitiesIdArray": hotelamenitiesIdArray,
        "deleted": deleted,
      };
}

enum LocalName {
  BALCONY,
  BEACH,
  CONCIERGE,
  ELEVATOR,
  FREE_WI_FI,
  HOUSEKEEPING,
  LAUNDRY,
  LIFT_SERVICE,
  MINI_BAR,
  PETFRIENDLY_HOTELS,
  RESTAURANT,
  ROOM_SERVICE,
  SAUNA,
  SPA,
  STEAM_ROOM,
  SWIMMING_POOL
}

final localNameValues = EnumValues({
  "Balcony": LocalName.BALCONY,
  "Beach": LocalName.BEACH,
  "Concierge": LocalName.CONCIERGE,
  "Elevator": LocalName.ELEVATOR,
  "Free WiFi": LocalName.FREE_WI_FI,
  "Housekeeping": LocalName.HOUSEKEEPING,
  "Laundry": LocalName.LAUNDRY,
  "Lift service": LocalName.LIFT_SERVICE,
  "Mini-bar": LocalName.MINI_BAR,
  "Petfriendly hotels": LocalName.PETFRIENDLY_HOTELS,
  "Restaurant": LocalName.RESTAURANT,
  "Room service": LocalName.ROOM_SERVICE,
  "Sauna": LocalName.SAUNA,
  "Spa": LocalName.SPA,
  "Steam room": LocalName.STEAM_ROOM,
  "Swimming pool": LocalName.SWIMMING_POOL
});

class HotelImageList {
  dynamic hotelImageId;
  dynamic hotelId;
  dynamic imageName;
  dynamic hotelCode;
  dynamic openImage;
  dynamic imageArray;
  dynamic deleteArray;
  dynamic imageIdArray;
  dynamic openImageArray;
  bool deleted;

  HotelImageList({
    required this.hotelImageId,
    required this.hotelId,
    required this.imageName,
    required this.hotelCode,
    required this.openImage,
    required this.imageArray,
    required this.deleteArray,
    required this.imageIdArray,
    required this.openImageArray,
    required this.deleted,
  });

  factory HotelImageList.fromJson(Map<String, dynamic> json) => HotelImageList(
        hotelImageId: json["hotel_image_id"],
        hotelId: json["hotel_id"],
        imageName: json["imageName"],
        hotelCode: json["hotel_code"],
        openImage: json["openImage"],
        imageArray: json["imageArray"],
        deleteArray: json["deleteArray"],
        imageIdArray: json["imageIdArray"],
        openImageArray: json["openImageArray"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_image_id": hotelImageId,
        "hotel_id": hotelId,
        "imageName": imageName,
        "hotel_code": hotelCode,
        "openImage": openImage,
        "imageArray": imageArray,
        "deleteArray": deleteArray,
        "imageIdArray": imageIdArray,
        "openImageArray": openImageArray,
        "deleted": deleted,
      };
}

class HotelTermsandConditionsList {
  int hotelTermsandConditionsId;
  int hotelId;
  dynamic description;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic hotelTermsandConditionsIdArray;
  dynamic termsAndConditionsArray;
  bool deleted;

  HotelTermsandConditionsList({
    required this.hotelTermsandConditionsId,
    required this.hotelId,
    required this.description,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.hotelTermsandConditionsIdArray,
    required this.termsAndConditionsArray,
    required this.deleted,
  });

  factory HotelTermsandConditionsList.fromJson(Map<String, dynamic> json) =>
      HotelTermsandConditionsList(
        hotelTermsandConditionsId: json["hotel_TermsandConditions_id"],
        hotelId: json["hotel_id"],
        description: json["description"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        hotelTermsandConditionsIdArray:
            json["hotel_TermsandConditions_idArray"],
        termsAndConditionsArray: json["termsAndConditionsArray"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_TermsandConditions_id": hotelTermsandConditionsId,
        "hotel_id": hotelId,
        "description": description,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "hotel_TermsandConditions_idArray": hotelTermsandConditionsIdArray,
        "termsAndConditionsArray": termsAndConditionsArray,
        "deleted": deleted,
      };
}

class IwtxHotelDetails {
  List<IwtxHotelDetailsDatum> data;

  IwtxHotelDetails({
    required this.data,
  });

  factory IwtxHotelDetails.fromJson(Map<String, dynamic> json) =>
      IwtxHotelDetails(
        data: List<IwtxHotelDetailsDatum>.from(
            json["data"].map((x) => IwtxHotelDetailsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class IwtxHotelDetailsDatum {
  int hotelDetailsId;
  dynamic postCode;
  dynamic contactDetails;
  dynamic hotelName;
  dynamic hotelCode;
  dynamic cityCode;
  dynamic hotelAddress;
  dynamic imagesurl;
  dynamic hotelChain;
  dynamic hotelStarRating;
  dynamic hotelPhone;
  dynamic hotelEmail;
  int hotelPostCode;
  dynamic hotelWeb;
  dynamic hotelCity;
  dynamic checkInTime;
  dynamic checkOutTime;

  IwtxHotelDetailsDatum({
    required this.hotelDetailsId,
    required this.postCode,
    required this.contactDetails,
    required this.hotelName,
    required this.hotelCode,
    required this.cityCode,
    required this.hotelAddress,
    required this.imagesurl,
    required this.hotelChain,
    required this.hotelStarRating,
    required this.hotelPhone,
    required this.hotelEmail,
    required this.hotelPostCode,
    required this.hotelWeb,
    required this.hotelCity,
    required this.checkInTime,
    required this.checkOutTime,
  });

  factory IwtxHotelDetailsDatum.fromJson(Map<String, dynamic> json) =>
      IwtxHotelDetailsDatum(
        hotelDetailsId: json["hotelDetailsId"],
        postCode: json["postCode"],
        contactDetails: json["contactDetails"],
        hotelName: json["hotelName"],
        hotelCode: json["hotelCode"],
        cityCode: json["cityCode"],
        hotelAddress: json["hotelAddress"],
        imagesurl: json["imagesurl"],
        hotelChain: json["hotelChain"],
        hotelStarRating: json["hotelStarRating"],
        hotelPhone: json["hotelPhone"],
        hotelEmail: json["hotelEmail"],
        hotelPostCode: json["hotelPostCode"],
        hotelWeb: json["hotelWeb"],
        hotelCity: json["hotelCity"],
        checkInTime: json["checkInTime"],
        checkOutTime: json["checkOutTime"],
      );

  Map<String, dynamic> toJson() => {
        "hotelDetailsId": hotelDetailsId,
        "postCode": postCode,
        "contactDetails": contactDetails,
        "hotelName": hotelName,
        "hotelCode": hotelCode,
        "cityCode": cityCode,
        "hotelAddress": hotelAddress,
        "imagesurl": imagesurl,
        "hotelChain": hotelChain,
        "hotelStarRating": hotelStarRating,
        "hotelPhone": hotelPhone,
        "hotelEmail": hotelEmail,
        "hotelPostCode": hotelPostCode,
        "hotelWeb": hotelWeb,
        "hotelCity": hotelCity,
        "checkInTime": checkInTime,
        "checkOutTime": checkOutTime,
      };
}

class JumeirahHotelDetails {
  List<JumeirahHotelDetailsDatum> data;

  JumeirahHotelDetails({
    required this.data,
  });

  factory JumeirahHotelDetails.fromJson(Map<String, dynamic> json) =>
      JumeirahHotelDetails(
        data: List<JumeirahHotelDetailsDatum>.from(
            json["data"].map((x) => JumeirahHotelDetailsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class JumeirahHotelDetailsDatum {
  int hotelId;
  int mapperId;
  dynamic name;
  dynamic title;
  dynamic defaultCurrency;
  dynamic latitude;
  dynamic longitude;
  dynamic images;
  dynamic videos;
  dynamic address;
  dynamic email;
  dynamic phone;
  dynamic countryName;
  dynamic countryIsoCode;
  dynamic city;
  bool openForBooking;
  dynamic hotelCode;
  dynamic datumHotelId;
  dynamic starRating;
  dynamic ratingDescription;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  bool deleted;

  JumeirahHotelDetailsDatum({
    required this.hotelId,
    required this.mapperId,
    required this.name,
    required this.title,
    required this.defaultCurrency,
    required this.latitude,
    required this.longitude,
    required this.images,
    required this.videos,
    required this.address,
    required this.email,
    required this.phone,
    required this.countryName,
    required this.countryIsoCode,
    required this.city,
    required this.openForBooking,
    required this.hotelCode,
    required this.datumHotelId,
    required this.starRating,
    required this.ratingDescription,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.deleted,
  });

  factory JumeirahHotelDetailsDatum.fromJson(Map<String, dynamic> json) =>
      JumeirahHotelDetailsDatum(
        hotelId: json["hotelId"],
        mapperId: json["mapperId"],
        name: json["name"],
        title: json["title"],
        defaultCurrency: json["default_currency"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        images: json["images"],
        videos: json["videos"],
        address: json["address"],
        email: json["email"],
        phone: json["phone"],
        countryName: json["country_name"],
        countryIsoCode: json["country_iso_code"],
        city: json["city"],
        openForBooking: json["open_for_booking"],
        hotelCode: json["hotel_code"],
        datumHotelId: json["hotel_id"],
        starRating: json["star_rating"],
        ratingDescription: json["rating_description"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "mapperId": mapperId,
        "name": name,
        "title": title,
        "default_currency": defaultCurrency,
        "latitude": latitude,
        "longitude": longitude,
        "images": images,
        "videos": videos,
        "address": address,
        "email": email,
        "phone": phone,
        "country_name": countryName,
        "country_iso_code": countryIsoCode,
        "city": city,
        "open_for_booking": openForBooking,
        "hotel_code": hotelCode,
        "hotel_id": datumHotelId,
        "star_rating": starRating,
        "rating_description": ratingDescription,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "deleted": deleted,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
