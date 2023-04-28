import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/uis/Forget_page/forget_page.dart';
import 'package:task/uis/login/login_page.dart';
import 'package:task/utils/constant.dart';

import '../pages/background_image.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const ForgetPage();
                        }),
                      ),
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      size: 30,
                      color: Color(0xFF151C47),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: SvgPicture.asset("assets/images/Group 6.svg"),
                  ),
                  const SizedBox(height: 50),
                  const Text("Reset Password ", style: kMainTextStyle),
                  const SizedBox(height: 25),
                  TextFormField(
                    cursorColor: const Color(0xFF323232),
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'New Password'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    cursorColor: const Color(0xFF323232),
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Re-Enter New Password'),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text(
                        "SAVE NEW PASSWORD",
                        style: kButtonStyle,
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF13DB87),
                        elevation: 0,
                        fixedSize: const Size(250, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
