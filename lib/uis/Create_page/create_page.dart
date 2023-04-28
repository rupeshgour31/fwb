import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/uis/Register_page/sign_up_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';

import '../login/login_page.dart';
import '../pages/background_image.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackgroundImage(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 115,
                ),
                padding: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Select Account Type",
                      style: kMainTextStyle,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    kDivide,
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        valuefirst = !valuefirst;
                        if (mounted) {
                          setState(() {
                            valuefirst = true;
                            valuesecond = false;
                            valuethird = false;
                            selected = "Register My Business";
                          });
                        }
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          valuefirst
                              ? Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF6F6F6),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Icon(
                                    Icons.check,
                                    color: Color(0xFF13DB87),
                                  ),
                                )
                              : Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6F6F6),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                          commantitle(
                            "Register My Business",
                            "Business Registration",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    kDivide,
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        valuesecond = !valuesecond;
                        if (mounted) {
                          setState(() {
                            valuefirst = false;
                            valuesecond = true;
                            valuethird = false;
                            selected = "Contract Professional";
                          });
                        }
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          valuesecond
                              ? Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF6F6F6),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Icon(
                                    Icons.check,
                                    color: Color(0xFF13DB87),
                                  ),
                                )
                              : Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6F6F6),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                          commantitle(
                            "Contract Professional",
                            "Get Leads",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    kDivide,
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        valuethird = !valuethird;
                        if (mounted) {
                          setState(() {
                            valuefirst = false;
                            valuesecond = false;
                            valuethird = true;
                            selected = "Business Owner";
                          });
                        }
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          valuethird
                              ? Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF6F6F6),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Icon(
                                    Icons.check,
                                    color: Color(0xFF13DB87),
                                  ),
                                )
                              : Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF6F6F6),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                          commantitle(
                            "Business Owner",
                            "Get Access To The List",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    kDivide,
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text(
                          "CREATE ACCOUNT",
                          style: kButtonStyle,
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF13DB87),
                          elevation: 0,
                          fixedSize: const Size(250, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (valuefirst == false &&
                              valuesecond == false &&
                              valuethird == false) {
                            showToast('Please select sign up type',
                                AppColors.redColor);
                          } else {
                            Navigator.pushNamed(
                              context,
                              SignUpPage.route,
                              arguments: selected,
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Already have an account, ",
                                style: kRichTextStyle,
                              ),
                              TextSpan(
                                text: "Login Here",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      LoginPage.route,
                                    );
                                  },
                                style: kRichTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65),
            child: SvgPicture.asset(
              "assets/images/logox.svg",
              height: 85,
            ),
          ),
        ],
      ),
    );
  }

  Widget commantitle(title, subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: kCheckStyle,
          ),
          Text(
            subtitle.toString(),
            style: kCheckStyle_1,
          ),
        ],
      ),
    );
  }
}
