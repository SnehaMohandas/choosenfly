// To parse this JSON data, do
//
//     final nativeModel = nativeModelFromJson(jsonString);

import 'dart:convert';

List<NativeModel> nativeModelFromJson(String str) => List<NativeModel>.from(
    json.decode(str).map((x) => NativeModel.fromJson(x)));

String nativeModelToJson(List<NativeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NativeModel {
  int countryId;
  int regionId;
  int marketNameId;
  dynamic selectedRegionId;
  String name;
  String countryCode;
  dynamic regionname;
  dynamic marketName;
  String whtCode;
  int acountryId;
  dynamic isoCode;
  bool deleted;

  NativeModel({
    required this.countryId,
    required this.regionId,
    required this.marketNameId,
    required this.selectedRegionId,
    required this.name,
    required this.countryCode,
    required this.regionname,
    required this.marketName,
    required this.whtCode,
    required this.acountryId,
    required this.isoCode,
    required this.deleted,
  });

  factory NativeModel.fromJson(Map<String, dynamic> json) => NativeModel(
        countryId: json["country_id"],
        regionId: json["region_id"],
        marketNameId: json["marketName_id"],
        selectedRegionId: json["selected_region_id"],
        name: json["name"],
        countryCode: json["countryCode"],
        regionname: json["regionname"],
        marketName: json["marketName"],
        whtCode: json["whtCode"],
        acountryId: json["acountry_id"],
        isoCode: json["iso_code"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "region_id": regionId,
        "marketName_id": marketNameId,
        "selected_region_id": selectedRegionId,
        "name": name,
        "countryCode": countryCode,
        "regionname": regionname,
        "marketName": marketName,
        "whtCode": whtCode,
        "acountry_id": acountryId,
        "iso_code": isoCode,
        "deleted": deleted,
      };
}
