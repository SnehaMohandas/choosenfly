// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

WalletModel walletModelFromJson(String str) =>
    WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  int agentcreditlimitId;
  int agentId;
  String creditlimit;
  String availableLimit;
  dynamic usedLimit;
  String remark;
  String companyName;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic totalcreditpaid;
  dynamic amountTobePaid;
  dynamic grandTotalcreditLimit;
  bool active;
  bool deleted;

  WalletModel({
    required this.agentcreditlimitId,
    required this.agentId,
    required this.creditlimit,
    required this.availableLimit,
    required this.usedLimit,
    required this.remark,
    required this.companyName,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.totalcreditpaid,
    required this.amountTobePaid,
    required this.grandTotalcreditLimit,
    required this.active,
    required this.deleted,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        agentcreditlimitId: json["agentcreditlimit_id"],
        agentId: json["agent_id"],
        creditlimit: json["creditlimit"],
        availableLimit: json["availableLimit"],
        usedLimit: json["usedLimit"],
        remark: json["remark"],
        companyName: json["company_name"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        totalcreditpaid: json["totalcreditpaid"],
        amountTobePaid: json["amountTobePaid"],
        grandTotalcreditLimit: json["grandTotalcreditLimit"],
        active: json["active"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "agentcreditlimit_id": agentcreditlimitId,
        "agent_id": agentId,
        "creditlimit": creditlimit,
        "availableLimit": availableLimit,
        "usedLimit": usedLimit,
        "remark": remark,
        "company_name": companyName,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "totalcreditpaid": totalcreditpaid,
        "amountTobePaid": amountTobePaid,
        "grandTotalcreditLimit": grandTotalcreditLimit,
        "active": active,
        "deleted": deleted,
      };
}
