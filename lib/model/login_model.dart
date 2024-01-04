// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int status;
  String message;
  Data data;
  String token;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  int agentId;
  String companyName;
  dynamic firstName;
  dynamic lastName;
  dynamic shortName;
  dynamic businessType;
  String companyCode;
  int agentCategoryId;
  dynamic password;
  int mainAgentId;
  int currencyId;
  dynamic creditLmit;
  dynamic creditUsage;
  dynamic excludeRegionId;
  dynamic excludeCountryId;
  dynamic selectedExternalApi;
  dynamic markup;
  String agentProfile;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic agentUrl;
  String userName;
  dynamic markupType;
  dynamic name;
  int markupvalue;
  dynamic contactDetailsDto;
  dynamic agentWalletDto;
  dynamic agentGstDetailsDto;
  dynamic agentStatus;
  dynamic currValue;
  dynamic currencyName;
  dynamic categoryName;
  int employeeCnt;
  int agentCnt;
  int newagentCnt;
  int newemployeeCnt;
  int countryId;
  int provinceId;
  int placeId;
  int agentgstId;
  dynamic agentClassification;
  dynamic agentGstIn;
  dynamic agentProvisionalGstno;
  dynamic agentCorrespondmail;
  dynamic agentRegisterstatus;
  dynamic agentHsncode;
  bool active;
  bool deleted;
  bool restApi;

  Data({
    required this.agentId,
    required this.companyName,
    required this.firstName,
    required this.lastName,
    required this.shortName,
    required this.businessType,
    required this.companyCode,
    required this.agentCategoryId,
    required this.password,
    required this.mainAgentId,
    required this.currencyId,
    required this.creditLmit,
    required this.creditUsage,
    required this.excludeRegionId,
    required this.excludeCountryId,
    required this.selectedExternalApi,
    required this.markup,
    required this.agentProfile,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.agentUrl,
    required this.userName,
    required this.markupType,
    required this.name,
    required this.markupvalue,
    required this.contactDetailsDto,
    required this.agentWalletDto,
    required this.agentGstDetailsDto,
    required this.agentStatus,
    required this.currValue,
    required this.currencyName,
    required this.categoryName,
    required this.employeeCnt,
    required this.agentCnt,
    required this.newagentCnt,
    required this.newemployeeCnt,
    required this.countryId,
    required this.provinceId,
    required this.placeId,
    required this.agentgstId,
    required this.agentClassification,
    required this.agentGstIn,
    required this.agentProvisionalGstno,
    required this.agentCorrespondmail,
    required this.agentRegisterstatus,
    required this.agentHsncode,
    required this.active,
    required this.deleted,
    required this.restApi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        agentId: json["agent_id"],
        companyName: json["company_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        shortName: json["short_name"],
        businessType: json["business_type"],
        companyCode: json["company_code"],
        agentCategoryId: json["agent_category_id"],
        password: json["password"],
        mainAgentId: json["main_agent_id"],
        currencyId: json["currency_id"],
        creditLmit: json["credit_lmit"],
        creditUsage: json["credit_usage"],
        excludeRegionId: json["exclude_region_id"],
        excludeCountryId: json["exclude_country_id"],
        selectedExternalApi: json["selected_external_api"],
        markup: json["markup"],
        agentProfile: json["agent_profile"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        agentUrl: json["agent_url"],
        userName: json["user_name"],
        markupType: json["markup_type"],
        name: json["name"],
        markupvalue: json["markupvalue"],
        contactDetailsDto: json["contactDetailsDTO"],
        agentWalletDto: json["agentWalletDTO"],
        agentGstDetailsDto: json["agentGSTDetailsDTO"],
        agentStatus: json["agent_status"],
        currValue: json["curr_value"],
        currencyName: json["currencyName"],
        categoryName: json["categoryName"],
        employeeCnt: json["employeeCnt"],
        agentCnt: json["agentCnt"],
        newagentCnt: json["newagentCnt"],
        newemployeeCnt: json["newemployeeCnt"],
        countryId: json["country_id"],
        provinceId: json["province_id"],
        placeId: json["place_id"],
        agentgstId: json["agentgst_id"],
        agentClassification: json["agent_classification"],
        agentGstIn: json["agent_gst_in"],
        agentProvisionalGstno: json["agent_provisional_gstno"],
        agentCorrespondmail: json["agent_correspondmail"],
        agentRegisterstatus: json["agent_registerstatus"],
        agentHsncode: json["agent_hsncode"],
        active: json["active"],
        deleted: json["deleted"],
        restApi: json["restAPI"],
      );

  Map<String, dynamic> toJson() => {
        "agent_id": agentId,
        "company_name": companyName,
        "first_name": firstName,
        "last_name": lastName,
        "short_name": shortName,
        "business_type": businessType,
        "company_code": companyCode,
        "agent_category_id": agentCategoryId,
        "password": password,
        "main_agent_id": mainAgentId,
        "currency_id": currencyId,
        "credit_lmit": creditLmit,
        "credit_usage": creditUsage,
        "exclude_region_id": excludeRegionId,
        "exclude_country_id": excludeCountryId,
        "selected_external_api": selectedExternalApi,
        "markup": markup,
        "agent_profile": agentProfile,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "agent_url": agentUrl,
        "user_name": userName,
        "markup_type": markupType,
        "name": name,
        "markupvalue": markupvalue,
        "contactDetailsDTO": contactDetailsDto,
        "agentWalletDTO": agentWalletDto,
        "agentGSTDetailsDTO": agentGstDetailsDto,
        "agent_status": agentStatus,
        "curr_value": currValue,
        "currencyName": currencyName,
        "categoryName": categoryName,
        "employeeCnt": employeeCnt,
        "agentCnt": agentCnt,
        "newagentCnt": newagentCnt,
        "newemployeeCnt": newemployeeCnt,
        "country_id": countryId,
        "province_id": provinceId,
        "place_id": placeId,
        "agentgst_id": agentgstId,
        "agent_classification": agentClassification,
        "agent_gst_in": agentGstIn,
        "agent_provisional_gstno": agentProvisionalGstno,
        "agent_correspondmail": agentCorrespondmail,
        "agent_registerstatus": agentRegisterstatus,
        "agent_hsncode": agentHsncode,
        "active": active,
        "deleted": deleted,
        "restAPI": restApi,
      };
}
