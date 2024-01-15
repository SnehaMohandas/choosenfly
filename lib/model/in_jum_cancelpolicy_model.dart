// To parse this JSON data, do
//
//     final jumInCancelPolicyModel = jumInCancelPolicyModelFromJson(jsonString);

import 'dart:convert';

List<JumInCancelPolicyModel> jumInCancelPolicyModelFromJson(String str) =>
    List<JumInCancelPolicyModel>.from(
        json.decode(str).map((x) => JumInCancelPolicyModel.fromJson(x)));

String jumInCancelPolicyModelToJson(List<JumInCancelPolicyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JumInCancelPolicyModel {
  int policydetailsId;
  int policyId;
  int type;
  int startDay;
  dynamic valuePercent;
  String policyRemark;
  dynamic policyType;
  int dayDifference;
  dynamic canceldate;
  int canceldays;
  bool validity;
  bool deleted;

  JumInCancelPolicyModel({
    required this.policydetailsId,
    required this.policyId,
    required this.type,
    required this.startDay,
    required this.valuePercent,
    required this.policyRemark,
    required this.policyType,
    required this.dayDifference,
    required this.canceldate,
    required this.canceldays,
    required this.validity,
    required this.deleted,
  });

  factory JumInCancelPolicyModel.fromJson(Map<String, dynamic> json) =>
      JumInCancelPolicyModel(
        policydetailsId: json["policydetails_id"],
        policyId: json["policy_id"],
        type: json["type"],
        startDay: json["startDay"],
        valuePercent: json["valuePercent"],
        policyRemark: json["policyRemark"],
        policyType: json["policyType"],
        dayDifference: json["dayDifference"],
        canceldate: json["canceldate"],
        canceldays: json["canceldays"],
        validity: json["validity"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "policydetails_id": policydetailsId,
        "policy_id": policyId,
        "type": type,
        "startDay": startDay,
        "valuePercent": valuePercent,
        "policyRemark": policyRemark,
        "policyType": policyType,
        "dayDifference": dayDifference,
        "canceldate": canceldate,
        "canceldays": canceldays,
        "validity": validity,
        "deleted": deleted,
      };
}
