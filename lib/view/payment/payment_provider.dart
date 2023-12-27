// import 'dart:convert';

// import 'package:amazon_payfort/amazon_payfort.dart';

// import 'package:choose_n_fly/view/payment/default_change_notifier.dart';
// import 'package:choose_n_fly/view/payment/font_constants.dart';
// import 'package:choose_n_fly/view/payment/payfort_api.dart';
// import 'package:choose_n_fly/view/payment/sdk_token_response.dart';
// import 'package:flutter_amazonpaymentservices/environment_type.dart';
// import 'package:flutter_amazonpaymentservices/flutter_amazonpaymentservices.dart';
// import 'package:network_info_plus/network_info_plus.dart';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;

// class PaymentProvider extends DefaultChangeNotifier {
//   final AmazonPayfort _payfort = AmazonPayfort.instance;

//   final NetworkInfo _info = NetworkInfo();

//   Future<void> init() async {
//     /// Step 1:  Initialize Amazon Payfort
//     var isinit = await AmazonPayfort.initialize(
//       const PayFortOptions(environment: FortConstants.environment),
//     );
//     print(isinit);
//   }

//   // Future<void> paymentWithCreditOrDebitCard({
//   //   required SucceededCallback onSucceeded,
//   //   required FailedCallback onFailed,
//   //   required CancelledCallback onCancelled,
//   // }) async {
//   //   try {
//   //     SdkTokenResponse? sdkTokenResponse = await _generateSdkToken();
//   //     print("ressss==>${sdkTokenResponse}");

//   //     // if (sdkTokenResponse != null && sdkTokenResponse.sdkToken == null) {
//   //     //   print("hello");
//   //     //   onFailed(sdkTokenResponse.responseMessage ?? '');
//   //     //   return;
//   //     // }

//   //     /// Step 4: Processing Payment [Amount multiply with 100] ex. 10 * 100 = 1000 (10 SAR)
//   //     /// Amount value send always round ex. [100] not [100.00, 100.21]
//   //     final url =
//   //         Uri.parse('https://sbpaymentservices.payfort.com/FortAPI/paymentApi');

//   //     final Map<String, dynamic> arrData = {
//   //       'command': 'PURCHASE',
//   //       'access_code': 'zx0IPmPy5jp1vAz8Kpg7',
//   //       'merchant_identifier': 'CycHZxVj',
//   //       'merchant_reference': 'XYZ9239-yu898',
//   //       'language': 'en',
//   //       'signature': '7cad05f0212ed933c9a5d5dffa31661acf2c827a',
//   //       'order_description': 'iPhone 6-S',
//   //       'customer_email': 'test@payfort.com',
//   //       'token_name': '7288fc8155014c57ad809d8e9574575e',
//   //       'sdk_token': 'Dwp78q3',
//   //     };

//   //     final response = await http.post(
//   //       url,
//   //       headers: {'Content-Type': 'application/json'},
//   //       body: jsonEncode(arrData),
//   //     );

//   //     print(response.body);
//   //     var result;
//   //     Future<void> validateApi() async {
//   //       var result;
//   //       var requestParam = {
//   //         "amount": 100,
//   //         "command": "AUTHORIZATION",
//   //         "currency": "USD",
//   //         "customer_email": "test@gmail.com",
//   //         "language": "en",
//   //         "merchant_reference": "f74689b50cb54fcab4664b4331163d5e",
//   //         "sdk_token": "f74689b50cb54fcab4664b4331163d5e"
//   //       };
//   //       try {
//   //         result = await FlutterAmazonpaymentservices.validateApi(
//   //           requestParam,
//   //           EnvironmentType.production,
//   //         );
//   //       } catch (e) {
//   //         print("Error ${e} details:${e}");
//   //         return;
//   //       }
//   //       print("Success ${result}");
//   //     }

//   //     // FortRequest request = FortRequest(
//   //     //   amount: 10 * 100,
//   //     //   customerName: 'Test Customer',
//   //     //   customerEmail: 'test@customer.com',
//   //     //   orderDescription: 'Test Order',
//   //     //   sdkToken: "f74689b50cb54fcab4664b4331163d5e",
//   //     //   merchantReference: "f74689b50cb54fcab4664b4331163d5e",
//   //     //   currency: 'SAR',
//   //     //   customerIp: (await _info.getWifiIP() ?? ''),
//   //     // );
//   //     // print("req====>${request}");

//   //     // _payfort.callPayFort(
//   //     //   request: request,
//   //     //   callBack: PayFortResultCallback(
//   //     //     onSucceeded: onSucceeded,
//   //     //     onFailed: onFailed,
//   //     //     onCancelled: onCancelled,
//   //     //   ),
//   //     // );
//   //   } catch (e) {
//   //     onFailed(e.toString());
//   //   }
//   // }

//   Future<void> paymentWithApplePay({
//     required SucceededCallback onSucceeded,
//     required FailedCallback onFailed,
//   }) async {
//     try {
//       SdkTokenResponse? sdkTokenResponse =
//           await _generateSdkToken(isApplePay: true);

//       if (sdkTokenResponse != null && sdkTokenResponse.sdkToken == null) {
//         onFailed(sdkTokenResponse.responseMessage ?? '');
//         return;
//       }

//       /// Step 4: Processing Payment [Don't multiply with 100]
//       /// Amount value send always round ex. [100] not [100.00, 100.21]
//       FortRequest request = FortRequest(
//         amount: 1000,
//         customerName: 'Test Customer',
//         customerEmail: 'test@customer.com',
//         orderDescription: 'Test Order',
//         sdkToken: sdkTokenResponse?.sdkToken ?? '',
//         merchantReference: const Uuid().v4(),
//         currency: 'SAR',
//         customerIp: (await _info.getWifiIP() ?? ''),
//       );

//       _payfort.callPayFortForApplePay(
//         request: request,
//         countryIsoCode: 'SA',
//         applePayMerchantId: FortConstants.applePayMerchantId,
//         callback: ApplePayResultCallback(
//           onSucceeded: onSucceeded,
//           onFailed: onFailed,
//         ),
//       );
//     } catch (e) {
//       onFailed(e.toString());
//     }
//   }

//   Future<SdkTokenResponse?> _generateSdkToken({bool isApplePay = false}) async {
//     try {
//       loading = true;

//       var accessCode = isApplePay
//           ? FortConstants.applePayAccessCode
//           : FortConstants.accessCode;
//       var shaRequestPhrase = isApplePay
//           ? FortConstants.applePayShaRequestPhrase
//           : FortConstants.shaRequestPhrase;
//       String? deviceId = await _payfort.getDeviceId();

//       /// Step 2:  Generate the Signature
//       SdkTokenRequest tokenRequest = SdkTokenRequest(
//         accessCode: accessCode,
//         deviceId: deviceId ?? '',
//         merchantIdentifier: FortConstants.merchantIdentifier,
//       );

//       String? signature = await _payfort.generateSignature(
//         shaType: FortConstants.shaType,
//         concatenatedString: tokenRequest.toConcatenatedString(shaRequestPhrase),
//       );

//       tokenRequest = tokenRequest.copyWith(signature: signature);
//       print(tokenRequest);

//       /// Step 3: Generate the SDK Token
//       return await PayFortApi.generateSdkToken(tokenRequest);
//     } finally {
//       loading = false;
//     }
//   }
// }
