import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingDetailShimmer extends StatelessWidget {
  const BookingDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CardLoading(
            borderRadius: BorderRadius.circular(10),
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const SizedBox(
            height: 15,
          ),
          CardLoading(
            borderRadius: BorderRadius.circular(10),
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          const SizedBox(
            height: 15,
          ),
          CardLoading(
            borderRadius: BorderRadius.circular(10),
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          const SizedBox(
            height: 25,
          ),
          CardLoading(
            borderRadius: BorderRadius.circular(10),
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const SizedBox(
            height: 15,
          ),
          CardLoading(
            borderRadius: BorderRadius.circular(10),
            height: MediaQuery.of(context).size.height * 0.12,
          ),
        ],
      ),
    ));
  }
}
