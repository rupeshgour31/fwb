import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/utils/constant.dart';

class AppBarScreen extends StatelessWidget {
  final String title;
  final bool toShowBackBtn;
  const AppBarScreen({
    Key? key,
    required this.title,
    this.toShowBackBtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: kMainTextStyle,
      ),
      automaticallyImplyLeading: false,
      leading: toShowBackBtn
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
              ),
            )
          : const SizedBox.shrink(),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, HomePage.route);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset(
              "assets/images/Notification.svg",
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
