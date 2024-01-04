import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loader() {
  return SpinKitCircle(
    //  shape: BoxShape.circle,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: BoxDecoration(
          color: index.isEven ? ColorConstant.primaryColor : ColorConstant.grey,
        ),
      );
    },
  );
}


//SpinKitFadingCircle