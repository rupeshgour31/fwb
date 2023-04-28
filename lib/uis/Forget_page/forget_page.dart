import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/uis/login/auth_view_model.dart';
import 'package:task/utils/common_textform_field.dart';
import 'package:task/utils/common_validations.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

import '../pages/background_image.dart';

class ForgetPage extends StatefulWidget {
  static const String route = 'ForgetPage';
  const ForgetPage({Key? key}) : super(key: key);

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> with CommonValidations {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                      child: SvgPicture.asset(
                        "assets/images/Group 6.svg",
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text("Lost Your Password?", style: kMainTextStyle),
                    const SizedBox(height: 15),
                    const Text(
                      "Enter your email to receive password reset instructions",
                      style: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Source Sans Pro'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 28),
                    CommonTextField(
                      hintText: 'Email or username',
                      controller: emailController,
                      textInputType: TextInputType.text,
                      validation: (String? value) => isRequiredValid(
                        emailController.text,
                        'Email or username',
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: const Text(
                          "CREATE NEW PASSWORD",
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
                          if (key.currentState!.validate()) {
                            context.read<AuthViewModel>().forgotPasswordReq(
                                context, emailController.text);
                          }
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const ResetPage();
                            }),
                          );*/
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const LoadingIndicatorConsumer<AuthViewModel>(),
        ],
      ),
    );
  }
}
