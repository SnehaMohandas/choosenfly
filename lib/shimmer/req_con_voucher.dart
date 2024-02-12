import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReqVoucherShimmer extends StatelessWidget {
  const ReqVoucherShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CardLoading(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          const SizedBox(
            height: 3,
          ),
          CardLoading(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          const SizedBox(
            height: 3,
          ),
          CardLoading(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          const SizedBox(
            height: 3,
          ),
          CardLoading(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          const SizedBox(
            height: 3,
          ),
          CardLoading(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],
      ),
    );
  }
}
