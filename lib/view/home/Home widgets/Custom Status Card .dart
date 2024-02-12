import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final Icon icon;
  final Color iconBackgroundColor;

  const CustomStatsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 11),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.043,
                width: MediaQuery.of(context).size.width * 0.095,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: icon),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.014,
                  //fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 8),
            child: Text(
              value,
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: MediaQuery.of(context).size.height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
