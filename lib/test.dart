// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Widget customContainer(BuildContext context) {
//   return Center(
//     child: Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: ScreenUtil().setHeight(150),
//           // color: Colors.amber,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: ScreenUtil().setHeight(130),
//                 width: ScreenUtil().setWidth(250),

//                 // height: MediaQuery.of(context).size.height * 0.15,
//                 // width: MediaQuery.of(context).size.width * 0.63,
//                 color: Colors.black,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: ScreenUtil().setWidth(50)),
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Asrfffttyyy cffddssww vvv vvffffffcccccccc",
//                         maxLines: 2,
//                         style: TextStyle(
//                           overflow: TextOverflow.ellipsis,
//                           color: Colors.white,
//                         ),
//                         textAlign: TextAlign.center,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           left: ScreenUtil().setWidth(25),
//           top: ScreenUtil().setHeight(35),
//           child: Container(
//             height: ScreenUtil().setHeight(78),
//             width: ScreenUtil().setWidth(78),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             child: const Center(
//                 child: Text(
//               "12",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             )),
//           ),
//         ),
//         Positioned(
//           right: ScreenUtil().setWidth(25),
//           top: ScreenUtil().setHeight(35),
//           child: Container(
//             height: ScreenUtil().setHeight(78),
//             width: ScreenUtil().setWidth(78),
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2),
//                 shape: BoxShape.circle,
//                 color: Colors.white),
//             child: const Center(
//                 child: Text(
//               "6",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             )),
//           ),
//         )
//       ],
//     ),
//   );
// }

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: customContainer(context),
//         // child: Container(
//         //   color: Colors.yellow,
//         //   height: ScreenUtil().setHeight(100),
//         //   width: ScreenUtil().setWidth(150),
//         // ),
//       ),
//     );
//   }
// }
