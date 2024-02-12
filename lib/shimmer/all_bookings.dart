import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AllBookingShimmer extends StatelessWidget {
  const AllBookingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          //scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return CardLoading(
              borderRadius: BorderRadius.circular(10),
              margin: const EdgeInsets.only(bottom: 18),
              height: 100,
              width: double.infinity,
            );
          }),
    );
  }
}
