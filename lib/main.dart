import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/splash/splash_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  //await ScreenUtil.ensureScreenSize();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    MyApp(), // Wrap your app
    //),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      supportedLocales: [
        Locale("en"),
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Choosenfly',
      //========test widget
      // builder: (context, child) {
      //   ScreenUtil.init(context);
      //   return Theme(
      //     data: ThemeData(
      //       fontFamily: "Plus Jakarta Sans",
      //       primarySwatch: buildMaterialColor(ColorConstant.primaryColor),
      //       primaryColor: ColorConstant.primaryColor,
      //     ),
      //     child: Test(),
      //   );
      // },
      //===========
      theme: ThemeData(
        fontFamily: "Plus Jakarta Sans",
        primarySwatch: buildMaterialColor(ColorConstant.primaryColor),
        primaryColor: ColorConstant.primaryColor,
      ),
      //   payment
      //==========
      // home: ChangeNotifierProvider(
      //   create: (context) => PaymentProvider(),
      //   child: const PaymentScreen(),
      // ),
      //================
      home: SplashScreen(),
    );
  }

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
