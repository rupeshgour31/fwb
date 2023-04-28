import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/utils/constant.dart';

class ViewButtonPage extends StatefulWidget {
  const ViewButtonPage({Key? key}) : super(key: key);

  @override
  State<ViewButtonPage> createState() => _ViewButtonPageState();
}

class _ViewButtonPageState extends State<ViewButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/Vector.svg",
            height: 14.0,
          ),
          wBox(5.0),
          const Text(
            "View Profile",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF383838),
      ),
    );
  }
}
