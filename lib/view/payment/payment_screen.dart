// import 'dart:convert';
// import 'dart:io';

// import 'package:amazon_payfort/amazon_payfort.dart';
// import 'package:choose_n_fly/view/payment/font_constants.dart';
// import 'package:choose_n_fly/view/payment/payfort_api.dart';
// import 'package:choose_n_fly/view/payment/payment_provider.dart';
// import 'package:choose_n_fly/view/payment/sdk_token_response.dart';
// import 'package:choose_n_fly/view/payment/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_amazonpaymentservices/environment_type.dart';
// import 'package:flutter_amazonpaymentservices/flutter_amazonpaymentservices.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart';

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   void _showSnackBar(String message) {
//     var snackBar = SnackBar(
//       elevation: 0,
//       backgroundColor: Colors.black,
//       duration: const Duration(seconds: 3),
//       content: Text(
//         message,
//         textAlign: TextAlign.left,
//         style: const TextStyle(
//           fontSize: 15,
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   @override
//   void initState() {
//     var deviceId = FlutterAmazonpaymentservices.getUDID;
//     super.initState();
//     // PaymentProvider paymentProvider = context.read<PaymentProvider>();
//     // paymentProvider.init();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PaymentProvider>(
//       builder: (context, paymentProvider, _) {
//         return Scaffold(
//           appBar: AppBar(title: const Text('Payment')),
//           body: Stack(
//             children: [
//               _buildPaymentMethods(),
//               // if (paymentProvider.loading) const Loading(),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   final Map<String, dynamic> arrData = {
//     'command': 'PURCHASE',
//     'access_code': 'zx0IPmPy5jp1vAz8Kpg7',
//     'merchant_identifier': 'CycHZxVj',
//     'merchant_reference': 'XYZ9239-yu898',
//     'language': 'en',
//     'signature': '7cad05f0212ed933c9a5d5dffa31661acf2c827a',
//     'order_description': 'iPhone 6-S',
//     'customer_email': 'test@payfort.com',
//     'token_name': '7288fc8155014c57ad809d8e9574575e',
//     'sdk_token': 'Dwp78q3',
//   };
//   Widget _buildPaymentMethods() {
//     var paymentProvider = context.read<PaymentProvider>();

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         PaymentMethodTile(
//           icon: Icons.credit_card,
//           name: 'Credit or Debit Card',
//           onPressed: () async {
//             final url = Uri.parse(
//                 'https://sbpaymentservices.payfort.com/FortAPI/paymentApi');

//             final response = await http.post(
//               url,
//               headers: {'Content-Type': 'application/json'},
//               body: jsonEncode(arrData),
//             );

//             print("bodyyyyy${response.body}");
//             var data = {
//               'command': 'AUTHORIZATION',
//               'access_code': 'zx0IPmPy5jp1vAz8Kpg7',
//               'merchant_identifier': 'CycHZxVj',
//               'merchant_reference': 'XYZ9239-yu898',
//               'amount': '10000',
//               'currency': 'AED',
//               'language': 'en',
//               'customer_email': 'test@payfort.com',
//               'order_description': 'iPhone 6-S',
//             };

//             print(calculateSignature(data, "YOUR_SHA_PHRASE"));

//             await getToken();
//             await getresponse();
//             await submit();
//           },
//         ),
//         Divider(
//           height: 0,
//           indent: 10,
//           endIndent: 10,
//           color: Colors.grey.shade400,
//         ),
//         if (Platform.isIOS)
//           PaymentMethodTile(
//             icon: Icons.apple,
//             iconSize: 28,
//             name: 'Apple Pay',
//             onPressed: () {
//               paymentProvider.paymentWithApplePay(
//                 onSucceeded: (result) {
//                   _showSnackBar('Transaction succeeded: ${result.fortId}');
//                 },
//                 onFailed: (error) {
//                   _showSnackBar(error);
//                 },
//               );
//             },
//           ),
//       ],
//     );
//   }

//   String calculateSignature(Map<String, dynamic> data, String shaPhrase) {
//     // Sorting the keys of the data
//     var sortedKeys = data.keys.toList()
//       ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

//     // Sorting the data and concatenating "=" between the key and the value
//     var sortedData =
//         Map.fromIterable(sortedKeys, key: (k) => k, value: (k) => data[k]);
//     var result =
//         sortedData.entries.map((entry) => "${entry.key}=${entry.value}").join();

//     // Adding the SHA Request Phrase and preparing the string for encryption
//     var resultString = "$shaPhrase$result$shaPhrase";

//     // Calculate SHA-256 hash
//     var bytes = utf8.encode(resultString);
//     var digest = sha256.convert(bytes);

//     return digest.toString();
//   }

//   //Flutter SDK Token Request
//   getToken() async {
//     var deviceId = await FlutterAmazonpaymentservices.getUDID;
//     var url = 'https://sbpaymentservices.payfort.com/FortAPI/paymentApi';
//     var arrData = {
//       'service_command': 'SDK_TOKEN',
//       'access_code': 'zx0IPmPy5jp1vAz8Kpg7',
//       'merchant_identifier': 'CycHZxVj',
//       'language': 'en',
//       "device_id": "${deviceId}",
//       // 'device_id': 'ffffffff-a9fa-0b44-7b27-29e70033c587',
//       // 'signature': '7cad05f0212ed933c9a5d5dffa31661acf2c827a',
//       "signature":
//           " 6b09599d25de2a2423a61e35838c0274aef6a2d9a807675c68f78ea7e4bd561b"
//     };

//     var headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };
//     var client = HttpClient();

//     try {
//       var request = await client.postUrl(Uri.parse(url));
//       headers.forEach((key, value) {
//         request.headers.set(key, value);
//       });

//       var jsonString = json.encode(arrData);
//       request.write(jsonString);

//       var response = await request.close();
//       var responseBody = await utf8.decodeStream(response);

//       print("try worked===${responseBody}");
//     } catch (error) {
//       print("catchhhhh worked");
//       print('Error: $error');
//     } finally {
//       client.close();
//     }
//   }

// //Flutter Mobile SDK Token Response
//   getresponse() async {
//     var url = 'https://sbpaymentservices.payfort.com/FortAPI/paymentApi';
//     var arrData = {
//       'command': 'PURCHASE',
//       'access_code': 'zx0IPmPy5jp1vAz8Kpg7',
//       'merchant_identifier': 'CycHZxVj',
//       'merchant_reference': 'XYZ9239-yu898',
//       'language': 'en',
//       "signature":
//           " 6b09599d25de2a2423a61e35838c0274aef6a2d9a807675c68f78ea7e4bd561b",
//       // "signaure": "",
//       // 'signature': '7cad05f0212ed933c9a5d5dffa31661acf2c827a',
//       'order_description': 'iPhone 6-S',
//       'customer_email': 'test@payfort.com',
//       // 'token_name': '7288fc8155014c57ad809d8e9574575e',
//       'sdk_token': 'Dwp78q3',
//     };

//     var headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };
//     var client = HttpClient();

//     try {
//       var request = await client.postUrl(Uri.parse(url));
//       headers.forEach((key, value) {
//         request.headers.set(key, value);
//       });

//       var jsonString = json.encode(arrData);
//       request.write(jsonString);

//       var response = await request.close();
//       var responseBody = await utf8.decodeStream(response);

//       print("veendum try${responseBody}");
//     } catch (error) {
//       print("veendum catch");
//       print('Error: $error');
//     } finally {
//       client.close();
//     }
//   }

//   submit() async {
//     var requestParam = {
//       "amount": 100,
//       "command": "AUTHORIZATION",
//       "currency": "USD",
//       "customer_email": "test@gmail.com",
//       "language": "en",
//       "merchant_reference": "f74689b50cb54fcab4664b4331163d5e",
//       "sdk_token": "Dwp78q3"
//       // "sdk_token": "f74689b50cb54fcab4664b4331163d5e"
//     };

//     try {
//       var result = await FlutterAmazonpaymentservices.normalPay(
//         requestParam,
//         EnvironmentType.production,
//         isShowResponsePage: true,
//       );
//       print("Success $result");
//     } catch (e) {
//       print("Error ${e}");
//       return;
//     }
//   }

//   // var requestParam = {
//   //   "amount": 100,
//   //   "command": "AUTHORIZATION",
//   //   "currency": "USD",
//   //   "customer_email": "test@gmail.com",
//   //   "language": "en",
//   //   // "merchant_reference": "XYZ9239-yu898",
//   //   "merchant_reference": "f74689b50cb54fcab4664b4331163d5e",
//   //   //   "sdk_token": "Dwp78q3"
//   //   "sdk_token": "f74689b50cb54fcab4664b4331163d5e"
//   // };
//   // validateApi() async {
//   //   var result;

//   //   try {
//   //     result = await FlutterAmazonpaymentservices.normalPay(
//   //         requestParam, EnvironmentType.production,
//   //         isShowResponsePage: true);
//   //   } catch (e) {
//   //     print("Error ${e} details:${e}");
//   //     return;
//   //   }
//   //   //print("Success ${result}");
//   // }
// }
